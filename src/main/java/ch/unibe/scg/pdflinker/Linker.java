package ch.unibe.scg.pdflinker;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
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
import ch.unibe.scg.pdflinker.clickable.Affiliation;
import ch.unibe.scg.pdflinker.clickable.Author;
import ch.unibe.scg.pdflinker.clickable.Reference;
import ch.unibe.scg.pdflinker.clickable.Title;

public class Linker {

	private static final float COLOR_ALPHA = 0.4f;
	private static final byte[] START = { 66, 84, 10, 47, 70, 53, 32, 48, 32, 84, 102, 10, 40, 60, 112, 100, 102, 45,
			108, 105, 110, 107, 101, 114, 62, 41, 32, 84, 106, 10, 69, 84, 10 };
	private static final byte[] END = { 66, 84, 10, 47, 70, 53, 32, 48, 32, 84, 102, 10, 40, 60, 47, 112, 100, 102, 45,
			108, 105, 110, 107, 101, 114, 62, 41, 32, 84, 106, 10, 69, 84, 10 };
	private static final String CONTENTS = "pdf-linker";
	private String id;

	public Linker(String id) {
		this.id = id;
	}

	public void link(File in, File out, Title title, List<Author> authors, List<Affiliation> affiliations,
			List<Reference> references) throws InvalidPasswordException, IOException {
		try (PDDocument document = PDDocument.load(in)) {
			this.removeHyperLinks(document);
			this.addHyperLinks(document, title, authors, affiliations, references);
			document.save(out);
		}
	}

	private void removeHyperLinks(PDDocument document) throws IOException {
		for (int i = 0; i < document.getNumberOfPages(); i = i + 1) {
			PDPage page = document.getPage(i);
			List<PDStream> contents = new ArrayList<>();
			Iterator<PDStream> iterator = page.getContentStreams();
			while (iterator.hasNext()) {
				PDStream stream = iterator.next();
				byte[] bytes = stream.toByteArray();
				boolean started = Arrays.equals(START,
						Arrays.copyOfRange(bytes, 0, Math.min(START.length, bytes.length)));
				boolean ended = Arrays.equals(END,
						Arrays.copyOfRange(bytes, Math.max(0, bytes.length - END.length), bytes.length));
				if (!(started && ended)) {
					contents.add(stream);
				}
			}
			page.setContents(contents);
			List<PDAnnotation> annotations = page.getAnnotations();
			annotations.stream().filter(a -> a instanceof PDAnnotationLink).map(a -> (PDAnnotationLink) a)
					.filter(l -> l.getContents() != null && l.getContents().equals(CONTENTS))
					.collect(Collectors.toList()).stream().forEach(l -> annotations.remove(l));
		}
	}

	private void addHyperLinks(PDDocument document, Title title, List<Author> authors, List<Affiliation> affiliations,
			List<Reference> references) throws IOException {
		List<AbstractClickable> clickables = new ArrayList<>();
		clickables.add(title);
		clickables.addAll(authors);
		clickables.addAll(affiliations);
		clickables.addAll(references);
		this.addHyperLinks(document, clickables);
	}

	private void addHyperLinks(PDDocument document, List<AbstractClickable> clickables) throws IOException {
		(new ParagraphStripper()).getParagraphs(document).stream()
				.map(paragraph -> this.findClickable(paragraph, clickables)).filter(Optional::isPresent)
				.map(Optional::get).forEach(clickable -> this.addHyperLink(document, clickable));
	}

	private Optional<AbstractClickable> findClickable(Paragraph paragraph, List<AbstractClickable> clickables) {
		String text = paragraph.getText().trim().toLowerCase();
		Optional<AbstractClickable> candidate = clickables.stream()
				.filter(clickable -> text.startsWith(clickable.getKey().trim().toLowerCase())).findFirst();
		candidate.ifPresent(clickable -> clickable.setParagraph(paragraph));
		return candidate;
	}

	private void addHyperLink(PDDocument document, AbstractClickable clickable) {
		Paragraph paragraph = clickable.getParagraph();
		try (PDPageContentStream content = new PDPageContentStream(document, paragraph.getPage(), AppendMode.PREPEND,
				true)) {
			PDRectangle rectangle = paragraph.getRectangle();
			PDExtendedGraphicsState graphicsState = new PDExtendedGraphicsState();
			graphicsState.setNonStrokingAlphaConstant(COLOR_ALPHA);
			content.beginText();
			content.setFont(PDType1Font.TIMES_ROMAN, 0);
			content.showText("<pdf-linker>");
			content.endText();
			content.saveGraphicsState();
			content.setGraphicsStateParameters(graphicsState);
			content.setNonStrokingColor(clickable.getColor());
			content.addRect(rectangle.getLowerLeftX(), rectangle.getLowerLeftY(), rectangle.getWidth(),
					rectangle.getHeight());
			content.fill();
			content.restoreGraphicsState();
			content.beginText();
			content.setFont(PDType1Font.TIMES_ROMAN, 0);
			content.showText("</pdf-linker>");
			content.endText();
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
			link.setRectangle(paragraph.getRectangle());
			paragraph.getPage().getAnnotations().add(0, link);
		} catch (IOException exception) {
			// TODO Auto-generated catch block
			exception.printStackTrace();
		}
	}

	private String asUri(AbstractClickable clickable) {
		return String.format("pharo://LiRePdfLinkerUriHandler/click%sWithId.in.?args=%s&args=%s",
				clickable.getClass().getSimpleName(), clickable.getId(),
				this.asUrlComponent(this.asUrlComponent(this.id)));
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

}
