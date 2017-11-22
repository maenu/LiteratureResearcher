package ch.unibe.scg.pdflinker.dom;

import java.util.Collection;
import java.util.Optional;

import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.text.TextPosition;

public abstract class Element {

	public static PDRectangle union(PDRectangle a, PDRectangle b) {
		PDRectangle rectangle = new PDRectangle();
		rectangle.setLowerLeftX(Math.min(a.getLowerLeftX(), b.getLowerLeftX()));
		rectangle.setLowerLeftY(Math.min(a.getLowerLeftY(), b.getLowerLeftY()));
		rectangle.setUpperRightX(Math.max(a.getUpperRightX(), b.getUpperRightX()));
		rectangle.setUpperRightY(Math.max(a.getUpperRightY(), b.getUpperRightY()));
		return rectangle;
	}

	public abstract Optional<Word> getWordContaining(TextPosition textPosition);

	public abstract Optional<Element> getElementContainingAll(Collection<TextPosition> textPositions);

	public abstract boolean contains(TextPosition textPosition);

	public abstract boolean containsAll(Collection<TextPosition> textPositions);

	public abstract PDRectangle getRectangle();

	public abstract String getText();

	@Override
	public String toString() {
		return this.getText();
	}

}
