package ch.unibe.scg.pdflinker.dom;

import java.util.ArrayList;
import java.util.List;

import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.text.TextPosition;

public class Word extends Element {

	private StringBuilder builder;
	private List<TextPosition> textPositions;

	public Word() {
		super();
		this.builder = new StringBuilder();
		this.textPositions = new ArrayList<>();
	}

	public void append(String string, List<TextPosition> textPositions) {
		this.builder.append(string);
		this.textPositions.addAll(textPositions);
	}

	@Override
	public PDRectangle getRectangle() {
		return this.textPositions.stream().map(this::asRectangle).reduce((a, b) -> union(a, b)).get();
	}

	@Override
	public String getText() {
		return this.builder.toString();
	}

	private PDRectangle asRectangle(TextPosition textPosition) {
		return new PDRectangle(textPosition.getX(), textPosition.getPageHeight() - textPosition.getY(),
				textPosition.getWidth(), textPosition.getHeight());
	}

}
