package ch.unibe.scg.pdflinker.dom;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

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
		// normalize dir to make equals work
		textPositions.forEach(TextPosition::getDir);
		this.textPositions.addAll(textPositions);
	}

	@Override
	public Optional<Word> getWordContaining(TextPosition textPosition) {
		// normalize dir to make equals work
		textPosition.getDir();
		if (this.contains(textPosition)) {
			return Optional.of(this);
		} else {
			return Optional.empty();
		}
	}

	@Override
	public Optional<Element> getElementContainingAll(Collection<TextPosition> textPositions) {
		// normalize dir to make equals work
		textPositions.forEach(TextPosition::getDir);
		if (this.containsAll(textPositions)) {
			return Optional.of(this);
		} else {
			return Optional.empty();
		}
	}

	@Override
	public boolean contains(TextPosition textPosition) {
		// normalize dir to make equals work
		textPosition.getDir();
		return this.textPositions.contains(textPosition);
	}

	@Override
	public boolean containsAll(Collection<TextPosition> textPositions) {
		return this.textPositions.containsAll(textPositions);
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
