package ch.unibe.scg.pdflinker.clickable;

import java.awt.Color;

public abstract class AbstractClickable {

	protected String id;
	protected String key;
	protected Color color;

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

}
