package ch.unibe.scg.pdflinker;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.PDPageContentStream.AppendMode;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.encryption.InvalidPasswordException;
import org.apache.pdfbox.pdmodel.graphics.state.PDExtendedGraphicsState;
import org.apache.pdfbox.pdmodel.interactive.action.PDActionURI;
import org.apache.pdfbox.pdmodel.interactive.annotation.PDAnnotationLink;
import org.apache.pdfbox.pdmodel.interactive.annotation.PDBorderStyleDictionary;

public class Linker {

	public void link(String id, File in, File out, List<AbstractReference> list)
			throws InvalidPasswordException, IOException {
		try (PDDocument document = PDDocument.load(in)) {
			(new ParagraphStripper()).getParagraphs(document).stream()
					.map(paragraph -> this.findReference(paragraph, list)).filter(Optional::isPresent)
					.map(Optional::get).forEach(reference -> this.addHyperLink(id, document, reference));
			document.save(out);
		}
	}

	private Optional<AbstractReference> findReference(Paragraph paragraph, List<AbstractReference> references) {
		String text = paragraph.getText();
		Optional<AbstractReference> candidate = references.stream()
				.filter(reference -> text.startsWith(reference.getKey())).findFirst();
		candidate.ifPresent(reference -> reference.setParagraph(paragraph));
		return candidate;
	}

	private void addHyperLink(String id, PDDocument document, AbstractReference reference) {
		Paragraph paragraph = reference.getParagraph();
		try (PDPageContentStream content = new PDPageContentStream(document, paragraph.getPage(), AppendMode.PREPEND,
				true)) {
			PDExtendedGraphicsState graphicsState = new PDExtendedGraphicsState();
			graphicsState.setNonStrokingAlphaConstant(0.2f);
			content.saveGraphicsState();
			PDRectangle rectangle = paragraph.getRectangle();
			content.setGraphicsStateParameters(graphicsState);
			content.setNonStrokingColor(reference.getColor());
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
			action.setURI(reference.asUri(id));
			PDAnnotationLink link = new PDAnnotationLink();
			link.setBorderStyle(borderStyle);
			link.setAction(action);
			link.setRectangle(paragraph.getRectangle());
			paragraph.getPage().getAnnotations().add(0, link);
		} catch (IOException exception) {
			// TODO Auto-generated catch block
			exception.printStackTrace();
		}
	}

}
