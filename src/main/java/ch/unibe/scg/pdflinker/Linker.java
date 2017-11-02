package ch.unibe.scg.pdflinker;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.PDPageContentStream.AppendMode;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.common.PDStream;
import org.apache.pdfbox.pdmodel.encryption.InvalidPasswordException;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.apache.pdfbox.pdmodel.graphics.state.PDExtendedGraphicsState;
import org.apache.pdfbox.pdmodel.interactive.action.PDActionURI;
import org.apache.pdfbox.pdmodel.interactive.annotation.PDAnnotation;
import org.apache.pdfbox.pdmodel.interactive.annotation.PDAnnotationLink;
import org.apache.pdfbox.pdmodel.interactive.annotation.PDBorderStyleDictionary;

import ch.unibe.scg.pdflinker.clickable.AbstractClickable;
import ch.unibe.scg.pdflinker.clickable.Author;
import ch.unibe.scg.pdflinker.clickable.Reference;
import ch.unibe.scg.pdflinker.clickable.Title;
import ch.unibe.scg.pdflinker.dom.DomParser;
import ch.unibe.scg.pdflinker.dom.Element;
import ch.unibe.scg.pdflinker.dom.Line;
import ch.unibe.scg.pdflinker.dom.Page;

public class Linker {

	private static final float COLOR_ALPHA = 0.4f;
	private static final Pattern START = Pattern.compile("^BT\n/F\\d+ 0 Tf\n\\(<pdf-linker>\\) Tj\nET");
	private static final String CONTENTS = "pdf-linker";
	private static final float PADDING = 3;

	private String id;

	public Linker(String id) {
		this.id = id;
	}

	public void link(File in, File out, Title title, List<Author> authors, List<Reference> references)
			throws InvalidPasswordException, IOException {
		try (PDDocument document = PDDocument.load(in)) {
			document.setAllSecurityToBeRemoved(true);
			this.removeHyperLinks(document);
			this.addHyperLinks(document, title, authors, references);
			document.save(out);
		}
	}

	private void removeHyperLinks(PDDocument document) throws IOException {
		for (int i = 0; i < document.getNumberOfPages(); i = i + 1) {
			PDPage page = document.getPage(i);
			List<PDStream> contents = new ArrayList<>();
			Iterator<PDStream> iterator = page.getContentStreams();
			while (iterator.hasNext()) {
				PDStream content = iterator.next();
				if (START.matcher(new String(content.toByteArray())).find()) {
					continue;
				}
				contents.add(content);
			}
			page.setContents(contents);
			List<PDAnnotation> annotations = page.getAnnotations();
			annotations.stream().filter(a -> a instanceof PDAnnotationLink).map(a -> (PDAnnotationLink) a)
					.filter(l -> l.getContents() != null && l.getContents().equals(CONTENTS))
					.collect(Collectors.toList()).stream().forEach(l -> annotations.remove(l));
		}
	}

	private void addHyperLinks(PDDocument document, Title title, List<Author> authors, List<Reference> references)
			throws IOException {
		(new DomParser()).parse(document).entrySet().stream().forEach(entry -> {
			this.addHyperLinksTitle(document, entry.getKey(), entry.getValue(), title);
			this.addHyperLinksAuthors(document, entry.getKey(), entry.getValue(), authors);
			this.addHyperLinksReferences(document, entry.getKey(), entry.getValue(), references);
		});
	}

	private void addHyperLinksTitle(PDDocument document, PDPage page, Page page0, Title title) {
		String titleNormalized = title.getKey().trim().toLowerCase();
		if (titleNormalized.isEmpty()) {
			return;
		}
		page0.getChildren().stream()
				.filter(p -> p.getText().replaceAll("\\s+", " ").trim().toLowerCase().contains(titleNormalized))
				.forEach(p -> this.addHyperLink(document, page, p.getRectangle(), title));

	}

	private void addHyperLinksAuthors(PDDocument document, PDPage page, Page page0, List<Author> authors) {
		Map<Author, List<String>> authorsNormalized = authors.stream()
				.collect(Collectors.toMap(a -> a,
						a -> Arrays.asList(a.getKey().trim().toLowerCase().replaceAll("[^a-z\\s]", "").split("\\s+"))))
				.entrySet().stream().filter(e -> !e.getValue().isEmpty())
				.collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
		if (authorsNormalized.isEmpty()) {
			return;
		}
		page0.getChildren().stream().flatMap(p -> p.getChildren().stream()).forEach(l -> {
			authors.stream().forEach(a -> {
				List<String> words = authorsNormalized.get(a);
				List<String> line = l.getChildren().stream()
						.map(w -> w.getText().trim().toLowerCase().replaceAll("[^a-z\\s]", ""))
						.collect(Collectors.toList());
				int i = Collections.indexOfSubList(line, words);
				if (i == -1) {
					return;
				}
				PDRectangle rectangle = l.getChildren().subList(i, i + words.size()).stream().map(Element::getRectangle)
						.reduce(Element::union).get();
				this.addHyperLink(document, page, rectangle, a);
			});
		});
	}

	private void addHyperLinksReferences(PDDocument document, PDPage page, Page page0, List<Reference> references) {
		Map<Reference, List<String>> referencesNormalized = references.stream()
				.collect(Collectors.toMap(r -> r, r -> Arrays.asList(r.getKey().trim().toLowerCase().split("\\s+"))))
				.entrySet().stream().filter(e -> !e.getValue().isEmpty())
				.collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
		if (referencesNormalized.isEmpty()) {
			return;
		}
		page0.getChildren().stream().forEach(p -> {
			Optional<Reference> current = Optional.empty();
			List<Line> currentLines = new ArrayList<>();
			for (Line l : p.getChildren()) {
				Optional<Reference> next = references.stream().filter(r -> {
					List<String> words = referencesNormalized.get(r);
					List<String> line = l.getChildren().stream().map(w -> w.getText().trim().toLowerCase())
							.collect(Collectors.toList());
					int i = Collections.indexOfSubList(line, words);
					return i == 0;
				}).findFirst();
				if (next.isPresent()) {
					if (current.isPresent() && next.get() != current.get()) {
						// finish current
						PDRectangle rectangle = currentLines.stream().map(Element::getRectangle).reduce(Element::union)
								.get();
						this.addHyperLink(document, page, rectangle, current.get());
					}
					current = next;
					currentLines = new ArrayList<>();
				}
				currentLines.add(l);
			}
			if (current.isPresent()) {
				// finish last
				PDRectangle rectangle = currentLines.stream().map(Element::getRectangle).reduce(Element::union).get();
				this.addHyperLink(document, page, rectangle, current.get());
			}
		});
	}

	private void addHyperLink(PDDocument document, PDPage page, PDRectangle rectangle, AbstractClickable clickable) {
		rectangle = this.normalizeRectangle(rectangle);
		try (PDPageContentStream content = new PDPageContentStream(document, page, AppendMode.PREPEND, true)) {
			content.beginText();
			content.setFont(PDType1Font.TIMES_ROMAN, 0);
			content.showText("<pdf-linker>");
			content.endText();
			PDExtendedGraphicsState graphicsState = new PDExtendedGraphicsState();
			graphicsState.setNonStrokingAlphaConstant(COLOR_ALPHA);
			content.saveGraphicsState();
			content.setGraphicsStateParameters(graphicsState);
			content.setNonStrokingColor(clickable.getColor());
			content.addRect(rectangle.getLowerLeftX(), rectangle.getLowerLeftY(), rectangle.getWidth(),
					rectangle.getHeight());
			content.fill();
			content.restoreGraphicsState();
		} catch (IOException exception) {
			// TODO Auto-generated catch block
			exception.printStackTrace();
		}
		try {
			PDBorderStyleDictionary borderStyle = new PDBorderStyleDictionary();
			borderStyle.setWidth(0);
			PDActionURI action = new PDActionURI();
			action.setURI(this.asUri(clickable));
			PDAnnotationLink link = new PDAnnotationLink();
			link.setContents(CONTENTS);
			link.setBorderStyle(borderStyle);
			link.setAction(action);
			link.setRectangle(rectangle);
			page.getAnnotations().add(0, link);
		} catch (IOException exception) {
			// TODO Auto-generated catch block
			exception.printStackTrace();
		}
	}

	private String asUri(AbstractClickable clickable) {
		return String.format("pharo://handle/click%sWithId.in.?args=%s&args=%s", clickable.getClass().getSimpleName(),
				this.asUrlComponent(clickable.getId()), this.asUrlComponent(this.id));
	}

	private String asUrlComponent(String s) {
		if (s == null) {
			return "";
		}
		try {
			return URLEncoder.encode(s, StandardCharsets.UTF_8.name());
		} catch (UnsupportedEncodingException exception) {
			throw new RuntimeException(exception);
		}
	}

	private PDRectangle normalizeRectangle(PDRectangle rectangle) {
		return new PDRectangle(rectangle.getLowerLeftX() - PADDING, rectangle.getLowerLeftY() - PADDING,
				rectangle.getWidth() + 2 * PADDING, rectangle.getHeight() + 2 * PADDING);
	}
}
