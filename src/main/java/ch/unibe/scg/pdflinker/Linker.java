package ch.unibe.scg.pdflinker;

import java.awt.Color;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Optional;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.PDPageContentStream.AppendMode;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.encryption.InvalidPasswordException;
import org.apache.pdfbox.pdmodel.interactive.action.PDActionURI;
import org.apache.pdfbox.pdmodel.interactive.annotation.PDAnnotationLink;

public class Linker {

	public void link(String id, File in, File out, List<String> keys) throws InvalidPasswordException, IOException {
		try (PDDocument document = PDDocument.load(in)) {
			(new ParagraphStripper()).getParagraphs(document).stream()
					.map(paragraph -> this.asReference(paragraph, keys)).filter(Optional::isPresent).map(Optional::get)
					.forEach(reference -> this.addHyperLink(id, document, reference));
			document.save(out);
		}
	}

	private Optional<Reference> asReference(Paragraph paragraph, List<String> keys) {
		String text = paragraph.getText();
		Optional<String> key = keys.stream().filter(text::startsWith).findFirst();
		return key.map(instance -> new Reference(paragraph, instance));
	}

	private void addHyperLink(String id, PDDocument document, Reference reference) {
		Paragraph paragraph = reference.getParagraph();
		try (PDPageContentStream content = new PDPageContentStream(document, paragraph.getPage(), AppendMode.PREPEND,
				true)) {
			PDRectangle rectangle = paragraph.getRectangle();
			content.setNonStrokingColor(Color.LIGHT_GRAY);
			content.addRect(rectangle.getLowerLeftX(), rectangle.getLowerLeftY(), rectangle.getWidth(),
					rectangle.getHeight());
			content.fill();
		} catch (IOException exception) {
			// TODO Auto-generated catch block
			exception.printStackTrace();
		}
		try {
			PDActionURI action = new PDActionURI();
			action.setURI(this.asUri(id, reference));
			PDAnnotationLink link = new PDAnnotationLink();
			link.setAction(action);
			link.setRectangle(paragraph.getRectangle());
			paragraph.getPage().getAnnotations().add(0, link);
		} catch (IOException exception) {
			// TODO Auto-generated catch block
			exception.printStackTrace();
		}
	}

	private String asUri(String id, Reference reference) throws UnsupportedEncodingException {
		return String.format("pharo://click?id=%s&key=%s&text=%s", URLEncoder.encode(id, StandardCharsets.UTF_8.name()),
				URLEncoder.encode(reference.getKey(), StandardCharsets.UTF_8.name()),
				URLEncoder.encode(reference.getParagraph().getText().substring(reference.getKey().length()).trim(),
						StandardCharsets.UTF_8.name()));
	}

}
