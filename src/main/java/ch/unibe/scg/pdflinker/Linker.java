package ch.unibe.scg.pdflinker;

import java.awt.Color;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.TreeSet;
import java.util.stream.Collectors;

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
			List<Reference> references = (new ParagraphStripper()).getParagraphs(document).stream()
					.map(paragraph -> this.asReference(paragraph, keys)).filter(Optional::isPresent).map(Optional::get)
					.collect(Collectors.toList());
			this.clean(references).forEach(reference -> this.addHyperLink(id, document, reference));
			document.save(out);
		}
	}

	private List<Reference> clean(List<Reference> references) {
		List<Integer> indexes = new ArrayList<>(new TreeSet<>(references.stream().map(Reference::getParagraph)
				.map(Paragraph::getPageIndex).collect(Collectors.toList())));
		int longestLength = 1;
		int end = 0;
		int length = 1;
		for (int i = 1; i < indexes.size(); i = i + 1) {
			if (indexes.get(i) != indexes.get(i - 1)) {
				length = 1;
			} else {
				length = length + 1;
			}
			// precedence for tail
			if (length >= longestLength) {
				longestLength = length;
				end = i;
			}
		}
		final List<Integer> bibliographyPageIndexes = indexes.subList(end - longestLength, end + 1);
		return references.stream()
				.filter(reference -> bibliographyPageIndexes.contains(reference.getParagraph().getPageIndex()))
				.collect(Collectors.toList());
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
