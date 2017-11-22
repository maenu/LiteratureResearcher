package ch.unibe.scg.pdflinker.link;

import java.awt.Color;
import java.util.Optional;

import org.apache.pdfbox.pdmodel.common.PDRectangle;

public abstract class Link {

	protected String key;
	protected Optional<String> id;
	protected Optional<String> text;
	protected Optional<PDRectangle> rectangle;
	protected Optional<Color> color;

	public Link(String key, Optional<String> id, Optional<String> text, Optional<PDRectangle> rectangle,
			Optional<Color> color) {
		this.key = key;
		this.id = id;
		this.text = text;
		this.rectangle = rectangle;
		this.color = color;
	}

	public String getKey() {
		return this.key;
	}

	public Optional<String> getId() {
		return this.id;
	}

	public Optional<String> getText() {
		return this.text;
	}

	public Optional<PDRectangle> getRectangle() {
		return this.rectangle;
	}

	public Optional<Color> getColor() {
		return this.color;
	}

}
