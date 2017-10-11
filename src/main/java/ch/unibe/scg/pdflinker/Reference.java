package ch.unibe.scg.pdflinker;

public class Reference {

	private Paragraph paragraph;
	private String key;

	public Reference(Paragraph paragraph, String key) {
		this.paragraph = paragraph;
		this.key = key;
	}

	public Paragraph getParagraph() {
		return this.paragraph;
	}

	public String getKey() {
		return this.key;
	}

}
