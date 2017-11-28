package ch.unibe.scg.pdflinker.link;

import java.awt.Color;
import java.util.Optional;

import org.apache.pdfbox.pdmodel.common.PDRectangle;

public abstract class Link {

	protected String key;
	protected Optional<String> id;
	protected Optional<String> text;
	protected Optional<Integer> page;
	protected Optional<PDRectangle> rectangle;
	protected Optional<Color> color;

	public Link(String key, Optional<String> id, Optional<String> text, Optional<Integer> page,
			Optional<PDRectangle> rectangle, Optional<Color> color) {
		this.key = key;
		this.id = id;
		this.text = text;
		this.page = page;
		this.rectangle = rectangle;
		this.color = color;
	}

	public String getKey() {
		return this.key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public Optional<String> getId() {
		return this.id;
	}

	public void setId(Optional<String> id) {
		this.id = id;
	}

	public Optional<String> getText() {
		return this.text;
	}

	public void setText(Optional<String> text) {
		this.text = text;
	}

	public Optional<Integer> getPage() {
		return this.page;
	}

	public void setPage(Optional<Integer> page) {
		this.page = page;
	}

	public Optional<PDRectangle> getRectangle() {
		return this.rectangle;
	}

	public void setRectangle(Optional<PDRectangle> rectangle) {
		this.rectangle = rectangle;
	}

	public Optional<Color> getColor() {
		return this.color;
	}

	public void setColor(Optional<Color> color) {
		this.color = color;
	}

}
