package ch.unibe.scg.pdflinker;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.output.NullWriter;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
import org.apache.pdfbox.text.TextPosition;

public class ParagraphStripper extends PDFTextStripper {

	private Paragraph currentParagraph;
	private List<Paragraph> paragraphs;

	public ParagraphStripper() throws IOException {
		super();
	}

	public List<Paragraph> getParagraphs(PDDocument document) throws IOException {
		this.currentParagraph = new Paragraph();
		this.paragraphs = new ArrayList<>();
		this.writeText(document, new NullWriter());
		return this.paragraphs;
	}

	@Override
	protected void writePageEnd() throws IOException {
		this.nextParagraph();
	}

	@Override
	protected void writeParagraphSeparator() throws IOException {
		this.nextParagraph();
	}

	@Override
	protected void writeString(String string, List<TextPosition> textPositions) throws IOException {
		this.currentParagraph.append(string, textPositions);
	}

	private void nextParagraph() {
		this.currentParagraph.setPage(this.getCurrentPageNo() - 1, this.document.getPage(this.getCurrentPageNo() - 1));
		this.paragraphs.add(this.currentParagraph);
		this.currentParagraph = new Paragraph();
	}

}
