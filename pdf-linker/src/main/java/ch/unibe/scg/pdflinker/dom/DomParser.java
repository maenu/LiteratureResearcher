package ch.unibe.scg.pdflinker.dom;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.output.NullWriter;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.text.PDFTextStripper;
import org.apache.pdfbox.text.TextPosition;

public class DomParser extends PDFTextStripper {

	private Page currentPage;
	private Paragraph currentParagraph;
	private Line currentLine;
	private Word currentWord;
	private Map<PDPage, Page> pages;

	public DomParser() throws IOException {
		super();
	}

	public Map<PDPage, Page> parse(PDDocument document) throws IOException {
		this.currentPage = new Page();
		this.currentParagraph = new Paragraph(this.currentPage);
		this.currentLine = new Line(this.currentParagraph);
		this.currentWord = new Word(this.currentLine);
		this.pages = new HashMap<>();
		this.writeText(document, new NullWriter());
		return this.pages;
	}

	@Override
	protected void writePageEnd() throws IOException {
		this.nextPage();
	}

	@Override
	protected void writeParagraphSeparator() throws IOException {
		this.nextParagraph();
	}

	@Override
	protected void writeLineSeparator() throws IOException {
		this.nextLine();
	}

	@Override
	protected void writeWordSeparator() throws IOException {
		this.nextWord();
	}

	@Override
	protected void writeString(String string, List<TextPosition> textPositions) throws IOException {
		this.currentWord.append(string, textPositions);
	}

	private void nextPage() {
		this.nextParagraph();
		this.pages.put(this.document.getPage(this.getCurrentPageNo() - 1), this.currentPage);
		this.currentPage = new Page();
	}

	private void nextParagraph() {
		this.nextLine();
		if (!this.currentParagraph.getChildren().isEmpty()) {
			this.currentPage.add(this.currentParagraph);
		}
		this.currentParagraph = new Paragraph(this.currentPage);
	}

	private void nextLine() {
		this.nextWord();
		if (!this.currentLine.getChildren().isEmpty()) {
			this.currentParagraph.add(this.currentLine);
		}
		this.currentLine = new Line(this.currentParagraph);
	}

	private void nextWord() {
		if (this.currentWord.getText().length() > 0) {
			this.currentLine.add(this.currentWord);
		}
		this.currentWord = new Word(this.currentLine);
	}

}
