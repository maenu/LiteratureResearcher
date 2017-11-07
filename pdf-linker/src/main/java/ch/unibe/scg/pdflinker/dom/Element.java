package ch.unibe.scg.pdflinker.dom;

import org.apache.pdfbox.pdmodel.common.PDRectangle;

public abstract class Element {

	public static PDRectangle union(PDRectangle a, PDRectangle b) {
		PDRectangle rectangle = new PDRectangle();
		rectangle.setLowerLeftX(Math.min(a.getLowerLeftX(), b.getLowerLeftX()));
		rectangle.setLowerLeftY(Math.min(a.getLowerLeftY(), b.getLowerLeftY()));
		rectangle.setUpperRightX(Math.max(a.getUpperRightX(), b.getUpperRightX()));
		rectangle.setUpperRightY(Math.max(a.getUpperRightY(), b.getUpperRightY()));
		return rectangle;
	}

	public abstract PDRectangle getRectangle();

	public abstract String getText();

	@Override
	public String toString() {
		return this.getText();
	}

}
