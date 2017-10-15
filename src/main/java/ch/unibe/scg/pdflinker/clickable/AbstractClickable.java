package ch.unibe.scg.pdflinker.clickable;

import java.awt.Color;

import ch.unibe.scg.pdflinker.Paragraph;

public abstract class AbstractClickable {

	protected String id;
	protected String key;
	protected Color color;
	protected Paragraph paragraph;

	public AbstractClickable(String id, String key, Color color) {
		this.id = id;
		this.key = key;
		this.color = color;
	}

	public String getId() {
		return this.id;
	}

	public String getKey() {
		return this.key;
	}

	public Color getColor() {
		return this.color;
	}

	public Paragraph getParagraph() {
		return this.paragraph;
	}

	public void setParagraph(Paragraph paragraph) {
		this.paragraph = paragraph;
	}

}
