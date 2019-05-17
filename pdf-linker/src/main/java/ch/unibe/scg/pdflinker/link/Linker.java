package ch.unibe.scg.pdflinker;

import java.awt.geom.Rectangle2D;
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
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.apache.pdfbox.pdmodel.graphics.state.PDExtendedGraphicsState;
import org.apache.pdfbox.pdmodel.interactive.action.PDActionURI;
import org.apache.pdfbox.pdmodel.interactive.annotation.PDAnnotation;
import org.apache.pdfbox.pdmodel.interactive.annotation.PDAnnotationLink;
import org.apache.pdfbox.pdmodel.interactive.annotation.PDAnnotationMarkup;
import org.apache.pdfbox.pdmodel.interactive.annotation.PDAnnotationSquareCircle;
import org.apache.pdfbox.pdmodel.interactive.annotation.PDAnnotationTextMarkup;
import org.apache.pdfbox.pdmodel.interactive.annotation.PDBorderStyleDictionary;
import org.apache.pdfbox.text.TextPosition;

import ch.unibe.scg.pdflinker.dom.DomParser;
import ch.unibe.scg.pdflinker.dom.Line;
import ch.unibe.scg.pdflinker.dom.Node;
import ch.unibe.scg.pdflinker.dom.Page;
import ch.unibe.scg.pdflinker.link.Author;
import ch.unibe.scg.pdflinker.link.Link;
import ch.unibe.scg.pdflinker.link.Links;
import ch.unibe.scg.pdflinker.link.Reference;
import ch.unibe.scg.pdflinker.link.Title;

public class Linker {

	private static final float LINK_COLOR_ALPHA = 0.4f;
	private static final Pattern LINK_START = Pattern.compile("^BT\n/F\\d+ 0 Tf\n\\(<pdf-linker>\\) Tj\nET");
	private static final String LINK_CONTENTS = "pdf-linker";
	private static final float LINK_PADDING = 3;
	private static final int MODIFIER_COLOR = 0;

	private PDDocument pdf;
	private Map<PDPage, Page> parse;
	private Links links;

	public Linker(PDDocument pdf, Links links) throws IOException {
		this.pdf = pdf;
		this.parse = new DomParser().parse(this.pdf);
		this.links = links;
	}

	public void link() throws IOException {
		this.removeLinks();
		this.addLinks();
		this.processLinkAnnotations();
	}

	private Links processLinkAnnotations() throws IOException {
		for (int i = 0; i < this.pdf.getNumberOfPages(); i = i + 1) {
			PDPage page = this.pdf.getPage(i);
			Page pageParse = this.parse.get(page);
			List<PDAnnotation> modifierAnnotations = new ArrayList<>();
			do {
				// bulk processing skips some annotations, do it one by one to work around that
				List<PDAnnotation> annotations = page.getAnnotations();
				modifierAnnotations = this.getModifierAnnotations(annotations);
				if (modifierAnnotations.isEmpty()) {
					break;
				}
				PDAnnotation modifierAnnotation = modifierAnnotations.iterator().next();
				Pair<String, List<TextPosition>> textPosition = this
						.getTextPositions(page, Collections.singletonList(modifierAnnotation.getRectangle())).iterator()
						.next();
				String text = textPosition.getV1();
				List<Node<?, ?>> words = textPosition.getV2().stream().map(pageParse::getNodeContaining)
						.filter(Optional::isPresent).map(Optional::get).collect(Collectors.toList());
				if (words.isEmpty()) {
					System.err.println("Could not find text for link to add: " + text);
					continue;
				}
				PDRectangle rectangle = words.stream().map(Node::getRectangle).reduce(Node::union).get();
				// TODO cheap heuristic for deciding on link type
				String key = String.join(" ", words.stream().map(Node::getText).collect(Collectors.toList()));
				if (i == 0 && (!this.links.getTitle().isPresent()
						|| !this.links.getTitle().get().getRectangle().isPresent())) {
					this.links.setTitle(Optional.of(new Title(key, Optional.empty(), Optional.of(text), Optional.of(i),
							Optional.of(rectangle), Optional.empty())));
				} else if (i == 0) {
					this.links.getAuthors().add(new Author(key, Optional.empty(), Optional.of(text), Optional.of(i),
							Optional.of(rectangle), Optional.empty()));
				} else {
					this.links.getReferences().add(new Reference(key, Optional.empty(), Optional.of(text),
							Optional.of(i), Optional.of(rectangle), Optional.empty()));
				}
				annotations.remove(modifierAnnotation);
			} while (!modifierAnnotations.isEmpty());
		}
		return this.links;
	}

	private List<PDAnnotation> getModifierAnnotations(List<PDAnnotation> annotations) throws IOException {
		List<PDAnnotation> modifiers = new ArrayList<>();
		for (PDAnnotation a : annotations) {
			if (a instanceof PDAnnotationTextMarkup && PDAnnotationTextMarkup.SUB_TYPE_HIGHLIGHT.equals(a.getSubtype())
					&& MODIFIER_COLOR == a.getColor().toRGB()
					|| a instanceof PDAnnotationSquareCircle && MODIFIER_COLOR == a.getColor().toRGB()
					|| a instanceof PDAnnotationMarkup && PDAnnotationMarkup.SUB_TYPE_INK.equals(a.getSubtype())
							&& MODIFIER_COLOR == a.getColor().toRGB()) {
				modifiers.add(a);
			}
		}
		return modifiers;
	}

	private List<Pair<String, List<TextPosition>>> getTextPositions(PDPage page, List<PDRectangle> rectangles)
			throws IOException {
		RegionTextExtrator extractor = new RegionTextExtrator();
		for (int i = 0; i < rectangles.size(); i = i + 1) {
			extractor.addRegion(Integer.toString(i), this.asRectangle2D(page, rectangles.get(i)));
		}
		extractor.extractRegions(page);
		List<Pair<String, List<TextPosition>>> textPositions = new ArrayList<>();
		for (int i = 0; i < rectangles.size(); i = i + 1) {
			textPositions.add(new Pair<>(extractor.getTextForRegion(Integer.toString(i)).trim(),
					extractor.getTextPositions(Integer.toString(i)).stream()
							.filter(p -> !p.getUnicode().trim().isEmpty()).collect(Collectors.toList())));
		}
		return textPositions;
	}

	private void removeLinks() throws IOException {
		for (int i = 0; i < this.pdf.getNumberOfPages(); i = i + 1) {
			PDPage page = this.pdf.getPage(i);
			List<PDStream> contents = new ArrayList<>();
			Iterator<PDStream> iterator = page.getContentStreams();
			while (iterator.hasNext()) {
				PDStream content = iterator.next();
				if (LINK_START.matcher(new String(content.toByteArray())).find()) {
					continue;
				}
				contents.add(content);
			}
			page.setContents(contents);
			List<PDAnnotation> annotations = page.getAnnotations();
			annotations.stream().filter(a -> a instanceof PDAnnotationLink).map(a -> (PDAnnotationLink) a)
					.filter(l -> l.getContents() != null && l.getContents().equals(LINK_CONTENTS))
					.collect(Collectors.toList()).stream().forEach(l -> annotations.remove(l));
		}
	}

	private void addLinks() throws IOException {
		for (int i = 0; i < this.pdf.getNumberOfPages(); i = i + 1) {
			PDPage page = this.pdf.getPage(i);
			Page pageParse = this.parse.get(page);
			this.addLinksTitle(i, page, pageParse);
			this.addLinksAuthors(i, page, pageParse);
			this.addLinksReferences(i, page, pageParse);
		}
	}

	private void addLinksTitle(int i, PDPage page, Page page0) {
		if (!this.links.getTitle().isPresent()) {
			return;
		}
		Title title = this.links.getTitle().get();
		if (title.getRectangle().isPresent() && title.getPage().isPresent() && title.getPage().get() == i) {
			this.addLink(page, title);
		} else {
			String normalizedKey = this.normalize(title.getKey());
			if (normalizedKey.isEmpty()) {
				return;
			}
			page0.getChildren().stream().filter(p -> this.normalize(p.getText()).equals(normalizedKey)).forEach(p -> {
				title.setRectangle(Optional.of(p.getRectangle()));
				title.setPage(Optional.of(i));
				this.addLink(page, title);
			});
		}
	}

	private void addLinksAuthors(int i, PDPage page, Page page0) {
		Map<Boolean, List<Author>> authors = this.links.getAuthors().stream()
				.collect(Collectors.partitioningBy(l -> l.getRectangle().isPresent()));
		if (authors.containsKey(true)) {
			authors.get(true).stream().filter(l -> l.getPage().isPresent() && l.getPage().get() == i)
					.forEach(l -> this.addLink(page, l));
		}
		if (authors.containsKey(false)) {
			Map<Author, List<String>> authorsNormalized = authors.get(false).stream().map(a -> {
				String normalizedKey = this.normalize(a.getKey());
				if (normalizedKey.isEmpty()) {
					return new Pair<>(a, Collections.<String>emptyList());
				}
				return new Pair<>(a, Arrays.asList(normalizedKey.split("\\s+")));
			}).filter(p -> {
				return !p.getV2().isEmpty();
			}).collect(Collectors.toMap(Pair::getV1, Pair::getV2));
			if (authorsNormalized.isEmpty()) {
				return;
			}
			page0.getChildren().stream().flatMap(p -> p.getChildren().stream()).forEach(l -> {
				authors.get(false).stream().forEach(a -> {
					List<String> words = authorsNormalized.get(a);
					if (words.isEmpty()) {
						return;
					}
					List<String> line = l.getChildren().stream().map(w -> this.normalize(w.getText()))
							.collect(Collectors.toList());
					int j = Collections.indexOfSubList(line, words);
					if (j == -1) {
						return;
					}
					PDRectangle rectangle = l.getChildren().subList(j, j + words.size()).stream()
							.map(Node::getRectangle).reduce(Node::union).get();
					a.setRectangle(Optional.of(rectangle));
					a.setPage(Optional.of(i));
					this.addLink(page, a);
				});
			});
		}
	}

	private void addLinksReferences(int i, PDPage page, Page page0) {
		Map<Boolean, List<Reference>> references = this.links.getReferences().stream()
				.collect(Collectors.partitioningBy(l -> l.getRectangle().isPresent()));
		if (references.containsKey(true)) {
			references.get(true).stream().filter(l -> l.getPage().isPresent() && l.getPage().get() == i)
					.forEach(l -> this.addLink(page, l));
		}
		if (references.containsKey(false)) {
			Map<Reference, String> referencesNormalized = references.get(false).stream().map(a -> {
				return new Pair<>(a, this.normalize(a.getKey()).replaceAll(" ", ""));
			}).filter(p -> {
				return !p.getV2().isEmpty();
			}).collect(Collectors.toMap(Pair::getV1, Pair::getV2));
			if (referencesNormalized.isEmpty()) {
				return;
			}
			page0.getChildren().stream().forEach(p -> {
				Optional<Reference> current = Optional.empty();
				List<Line> currentLines = new ArrayList<>();
				for (Line l : p.getChildren()) {
					Optional<Reference> next = referencesNormalized.entrySet().stream().filter(e -> {
						return this.normalize(l.getText()).replaceAll(" ", "")
								.startsWith(this.normalize(e.getValue()).replaceAll(" ", ""));
					}).map(Map.Entry::getKey).findFirst();
					if (next.isPresent()) {
						if (current.isPresent() && next.get() != current.get()) {
							// finish current
							PDRectangle rectangle = currentLines.stream().map(Node::getRectangle).reduce(Node::union)
									.get();
							current.get().setRectangle(Optional.of(rectangle));
							current.get().setPage(Optional.of(i));
							this.addLink(page, current.get());
						}
						current = next;
						currentLines = new ArrayList<>();
					}
					currentLines.add(l);
				}
				if (current.isPresent()) {
					// finish last
					PDRectangle rectangle = currentLines.stream().map(Node::getRectangle).reduce(Node::union).get();
					current.get().setRectangle(Optional.of(rectangle));
					current.get().setPage(Optional.of(i));
					this.addLink(page, current.get());
				}
			});
		}
	}

	private void addLink(PDPage page, Link link) {
		assert link.getRectangle().isPresent();
		PDRectangle rectangle = this.asNormalizedRectangle(link.getRectangle().get());
		try (PDPageContentStream content = new PDPageContentStream(this.pdf, page, AppendMode.PREPEND, true)) {
			content.beginText();
			content.setFont(PDType1Font.TIMES_ROMAN, 0);
			content.showText("<pdf-linker>");
			content.endText();
			PDExtendedGraphicsState graphicsState = new PDExtendedGraphicsState();
			graphicsState.setNonStrokingAlphaConstant(LINK_COLOR_ALPHA);
			content.saveGraphicsState();
			content.setGraphicsStateParameters(graphicsState);
			content.setNonStrokingColor(link.getColor().get());
			content.addRect(rectangle.getLowerLeftX(), rectangle.getLowerLeftY(), rectangle.getWidth(),
					rectangle.getHeight());
			content.fill();
			content.restoreGraphicsState();
			PDBorderStyleDictionary borderStyle = new PDBorderStyleDictionary();
			borderStyle.setWidth(0);
			PDActionURI action = new PDActionURI();
			action.setURI(this.asUri(link));
			PDAnnotationLink annotation = new PDAnnotationLink();
			annotation.setContents(LINK_CONTENTS);
			annotation.setBorderStyle(borderStyle);
			annotation.setAction(action);
			annotation.setRectangle(rectangle);
			page.getAnnotations().add(0, annotation);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	private String asUri(Link link) {
		return String.format("pharo://handle/click%sWithId.in.?args=%s&args=%s", link.getClass().getSimpleName(),
				this.asUrlComponent(link.getId().get()), this.asUrlComponent(this.links.getId()));
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

	private PDRectangle asNormalizedRectangle(PDRectangle rectangle) {
		return new PDRectangle(rectangle.getLowerLeftX() - LINK_PADDING, rectangle.getLowerLeftY() - LINK_PADDING,
				rectangle.getWidth() + 2 * LINK_PADDING, rectangle.getHeight() + 2 * LINK_PADDING);
	}

	private Rectangle2D asRectangle2D(PDPage page, PDRectangle rectangle) {
		return new Rectangle2D.Float(rectangle.getLowerLeftX(),
				page.getMediaBox().getHeight() - rectangle.getUpperRightY(), rectangle.getWidth(),
				rectangle.getHeight());
	}

	private String normalize(String s) {
		return s.trim().toLowerCase().replaceAll("[^a-z0-9\\[\\]]", "").replaceAll("\\s+", " ");
	}

}
