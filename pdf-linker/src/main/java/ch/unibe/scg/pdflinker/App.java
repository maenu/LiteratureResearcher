package ch.unibe.scg.pdflinker;

import java.awt.Color;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.DefaultParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;
import org.apache.pdfbox.pdmodel.encryption.InvalidPasswordException;

import com.google.gson.Gson;

import ch.unibe.scg.pdflinker.clickable.Author;
import ch.unibe.scg.pdflinker.clickable.Reference;
import ch.unibe.scg.pdflinker.clickable.Title;

public class App {

	private static final String HELP = "help";
	private static final String ID = "id";
	private static final String INPUT = "input";
	private static final String OUTPUT = "output";
	private static final String TITLE = "title";
	private static final String AUTHORS = "authors";
	private static final String REFERENCES = "references";
	private static final String HEADER = "JSON links must have id, key, and color properties. They look like this:\n"
			+ "{\n    \"id\": <string>,\n    \"key\": <string>,\n    \"color\": [<number:0-255>, <number:0-255>, <number:0-255>]\n}";

	public static void main(String[] args) throws InvalidPasswordException, IOException {
		Options options = newOptions();
		try {
			CommandLine line = (new DefaultParser()).parse(options, args);
			if (line.hasOption(HELP)) {
				showHelp(options);
				System.exit(0);
			}
			String id = line.getOptionValue(ID);
			File input = new File(line.getOptionValue(INPUT));
			File output = new File(line.getOptionValue(OUTPUT));
			Title title = parse(Title.class, line.getOptionValue(TITLE));
			List<Author> authors = parseAll(Author.class, line.getOptionValue(AUTHORS));
			List<Reference> references = parseAll(Reference.class, line.getOptionValue(REFERENCES));
			(new Linker(id)).link(input, output, title, authors, references);
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
		options.addOption(Option.builder("i").longOpt(ID).desc("use paper ID for self references").hasArg()
				.argName("ID").build());
		options.addOption(
				Option.builder("in").longOpt("input").desc("process INPUT PDF file").hasArg().argName("INPUT").build());
		options.addOption(Option.builder("out").longOpt("output").desc("store result in OUTPUT PDF file").hasArg()
				.argName("OUTPUT").build());
		options.addOption(Option.builder("t").longOpt("title")
				.desc("link TITLE JSON in the link format described before").hasArg().argName("TITLE").build());
		options.addOption(Option.builder("a").longOpt("authors")
				.desc("link AUTHORS JSON array in the link format described before").hasArg().argName("AUTHORS")
				.build());
		options.addOption(Option.builder("r").longOpt("references")
				.desc("link REFERENCES JSON array in the link format described before").hasArg().argName("REFERENCES")
				.build());
		return options;
	}

	private static <E> E parse(Class<E> cls, String s) {
		Map<String, Object> simplification = ((new Gson()).fromJson(s, HashMap.class));
		return asInstance(cls, simplification);
	}

	private static <E> List<E> parseAll(Class<E> cls, String s) {
		List<Map<String, Object>> simplifications = ((new Gson()).fromJson(s, ArrayList.class));
		simplifications.stream().map(simplification -> asInstance(cls, simplification)).collect(Collectors.toList());
		List<E> objects = new ArrayList<>();
		for (int i = 0; i < simplifications.size(); i = i + 1) {
			objects.add(asInstance(cls, simplifications.get(i)));
		}
		return objects;
	}

	private static <E> E asInstance(Class<E> cls, Map<String, Object> simplification) {
		try {
			List<Double> color = (List<Double>) simplification.get("color");
			return (E) cls.getConstructors()[0].newInstance(simplification.get(ID), simplification.get("key"),
					new Color(color.get(0).intValue(), color.get(1).intValue(), color.get(2).intValue()));
		} catch (InstantiationException | IllegalAccessException | IllegalArgumentException | InvocationTargetException
				| SecurityException exception) {
			throw new RuntimeException(exception);
		}
	}

}
