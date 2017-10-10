package ch.unibe.scg.pdflinker;

import java.awt.Color;
import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.PDPageContentStream.AppendMode;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.encryption.InvalidPasswordException;
import org.apache.pdfbox.pdmodel.graphics.color.PDColor;
import org.apache.pdfbox.pdmodel.graphics.color.PDDeviceRGB;
import org.apache.pdfbox.pdmodel.interactive.action.PDAction;
import org.apache.pdfbox.pdmodel.interactive.action.PDActionGoTo;
import org.apache.pdfbox.pdmodel.interactive.action.PDActionURI;
import org.apache.pdfbox.pdmodel.interactive.annotation.PDAnnotation;
import org.apache.pdfbox.pdmodel.interactive.annotation.PDAnnotationLink;
import org.apache.pdfbox.pdmodel.interactive.documentnavigation.destination.PDDestination;
import org.apache.pdfbox.pdmodel.interactive.documentnavigation.destination.PDNamedDestination;
import org.apache.pdfbox.pdmodel.interactive.documentnavigation.destination.PDPageDestination;

public class Linker {

	private static final PDColor COLOR = new PDColor(new float[] { 0, 0, 1 }, PDDeviceRGB.INSTANCE);;

	public void link(File in, File out) throws InvalidPasswordException, IOException {
		try (PDDocument document = PDDocument.load(in)) {
			ParagraphStripper stripper = new ParagraphStripper();
			stripper.getParagraphs(document).stream().filter(paragraph -> paragraph.getText().startsWith("["))
					.forEach(paragraph -> this.addHyperLink(document, paragraph));
			document.save(out);
		}
	}

	private void addHyperLink(PDDocument document, Paragraph paragraph) {
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
			action.setURI("http://scg.unibe.ch");
			PDAnnotationLink link = new PDAnnotationLink();
			link.setContents("asdfasdfasdfasdfasdf");
			link.setColor(COLOR);
			link.setAction(action);
			link.setRectangle(paragraph.getRectangle());
			document.getPage(paragraph.getPageIndex()).getAnnotations().add(0, link);
		} catch (IOException exception) {
			// TODO Auto-generated catch block
			exception.printStackTrace();
		}
	}

	private void tmp(PDDocument document) throws IOException {
		for (PDPage page : document.getPages()) {
			List<PDAnnotation> annotations = page.getAnnotations();
			for (PDAnnotation annot : annotations) {
				if (annot instanceof PDAnnotationLink) {
					PDAnnotationLink link = (PDAnnotationLink) annot;
					PDAction action = link.getAction();
					if (action instanceof PDActionGoTo) {
						PDDestination destination = ((PDActionGoTo) action).getDestination();
						if (destination instanceof PDNamedDestination) {
							PDPageDestination pageDestination = document.getDocumentCatalog()
									.findNamedDestinationPage((PDNamedDestination) destination);
							if (pageDestination != null) {
								// System.out.println(pageDestination);
							}
						}
					}
				}
			}
		}
	}

}
