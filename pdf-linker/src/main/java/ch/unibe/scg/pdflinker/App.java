package ch.unibe.scg.pdflinker;

import java.awt.Color;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.DefaultParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.encryption.InvalidPasswordException;

import com.google.gson.Gson;

import ch.unibe.scg.pdflinker.link.Author;
import ch.unibe.scg.pdflinker.link.Link;
import ch.unibe.scg.pdflinker.link.Links;
import ch.unibe.scg.pdflinker.link.Reference;
import ch.unibe.scg.pdflinker.link.Title;

public class App {

	private static final String HELP = "help";
	private static final String INPUT = "input";
	private static final String OUTPUT = "output";
	private static final String LINKS = "links";
	private static final String TITLE = "title";
	private static final String AUTHORS = "authors";
	private static final String REFERENCES = "references";
	private static final String KEY = "key";
	private static final String ID = "id";
	private static final String TEXT = "text";
	private static final String RECTANGLE = "rectangle";
	private static final String COLOR = "color";
	private static final String HEADER = "JSON links must have id, key, and color properties. They look like this:\n"
			+ "{\n    \"id\": <string>,\n    \"key\": <string>,\n    \"color\": [<number:0-255>, <number:0-255>, <number:0-255>]\n}";

	public static void main(String[] args) throws InvalidPasswordException, IOException {
		Options options = newOptions();
		try {
			CommandLine line = new DefaultParser().parse(options, args);
			if (line.hasOption(HELP)) {
				showHelp(options);
				System.exit(0);
			}
			File input = new File(line.getOptionValue(INPUT));
			File output = new File(line.getOptionValue(OUTPUT));
			Links links = parse(line.getOptionValue(LINKS));
			try (PDDocument document = PDDocument.load(input)) {
				document.setAllSecurityToBeRemoved(true);
				links = new Linker(document, links).link();
				document.save(output);
				System.out.println(render(links));
			}
		} catch (ParseException exp) {
			showHelp(options);
			System.exit(1);
		}
	}

	private static void showHelp(Options options) {
		HelpFormatter formatter = new HelpFormatter();
		formatter.printHelp("pdf-linker", HEADER, options, null);
	}

	private static Options newOptions() {
		Options options = new Options();
		options.addOption(Option.builder("h").longOpt(HELP).desc("show help").build());
		options.addOption(
				Option.builder("i").longOpt("input").desc("process INPUT PDF file").hasArg().argName("INPUT").build());
		options.addOption(Option.builder("o").longOpt("output").desc("store result in OUTPUT PDF file").hasArg()
				.argName("OUTPUT").build());
		options.addOption(Option.builder("l").longOpt(LINKS)
				.desc("LINKS JSON must have the the keys id, authors and references. The key title is optional. ")
				.hasArg().argName("LINKS").build());
		return options;
	}

	private static Links parse(String s) {
		Map<String, Object> simplification = new Gson().fromJson(s, HashMap.class);
		Links links = new Links((String) simplification.get(ID));
		if (simplification.containsKey(TITLE)) {
			links.setTitle(
					Optional.of(fromSimplification(Title.class, (Map<String, Object>) simplification.get(TITLE))));
		}
		((List<Map<String, Object>>) simplification.get(AUTHORS)).stream()
				.map(ss -> fromSimplification(Author.class, ss)).forEach(a -> links.getAuthors().add(a));
		((List<Map<String, Object>>) simplification.get(REFERENCES)).stream()
				.map(ss -> fromSimplification(Reference.class, ss)).forEach(a -> links.getReferences().add(a));
		return links;
	}

	private static <E> E fromSimplification(Class<E> cls, Map<String, Object> simplification) {
		try {
			String key = (String) simplification.get(KEY);
			Optional<String> id = Optional.empty();
			Optional<String> text = Optional.empty();
			Optional<PDRectangle> rectangle = Optional.empty();
			Optional<Color> color = Optional.empty();
			if (simplification.containsKey(ID)) {
				id = Optional.of((String) simplification.get(ID));
			}
			if (simplification.containsKey(TEXT)) {
				text = Optional.of((String) simplification.get(TEXT));
			}
			if (simplification.containsKey(RECTANGLE)) {
				List<Double> data = (List<Double>) simplification.get(RECTANGLE);
				rectangle = Optional.of(new PDRectangle(data.get(0).floatValue(), data.get(1).floatValue(),
						data.get(2).floatValue(), data.get(3).floatValue()));
			}
			if (simplification.containsKey(COLOR)) {
				List<Double> data = (List<Double>) simplification.get(COLOR);
				color = Optional.of(new Color(data.get(0).intValue(), data.get(1).intValue(), data.get(2).intValue()));
			}
			return (E) cls.getConstructors()[0].newInstance(key, id, text, rectangle, color);
		} catch (InstantiationException | IllegalAccessException | IllegalArgumentException | InvocationTargetException
				| SecurityException exception) {
			throw new RuntimeException(exception);
		}
	}

	private static String render(Links links) {
		Map<String, Object> simplification = new HashMap<>();
		simplification.put(ID, links.getId());
		links.getTitle().ifPresent(o -> simplification.put(TITLE, toSimplification(o)));
		simplification.put(AUTHORS,
				links.getAuthors().stream().map(App::toSimplification).collect(Collectors.toList()));
		simplification.put(REFERENCES,
				links.getReferences().stream().map(App::toSimplification).collect(Collectors.toList()));
		return new Gson().toJson(simplification);
	}

	private static Map<String, Object> toSimplification(Link link) {
		Map<String, Object> simplification = new HashMap<>();
		simplification.put(KEY, link.getKey());
		link.getId().ifPresent(o -> simplification.put(ID, o));
		link.getText().ifPresent(o -> simplification.put(TEXT, o));
		link.getRectangle().ifPresent(o -> {
			float[] rectangle = new float[4];
			rectangle[0] = o.getLowerLeftX();
			rectangle[1] = o.getLowerLeftY();
			rectangle[2] = o.getWidth();
			rectangle[3] = o.getHeight();
			simplification.put(RECTANGLE, rectangle);
		});
		link.getColor().ifPresent(o -> {
			int[] color = new int[3];
			color[0] = o.getRed();
			color[1] = o.getGreen();
			color[2] = o.getBlue();
			simplification.put(COLOR, color);
		});
		return simplification;
	}

}
