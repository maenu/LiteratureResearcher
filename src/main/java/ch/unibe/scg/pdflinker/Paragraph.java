package ch.unibe.scg.pdflinker;

import java.util.ArrayList;
import java.util.List;

import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.text.TextPosition;

public class Paragraph {

	private int pageIndex;
	private PDPage page;
	private StringBuilder builder;
	private List<TextPosition> textPositions;

	public Paragraph() {
		this.builder = new StringBuilder();
		this.textPositions = new ArrayList<>();
	}

	public void append(String string, List<TextPosition> textPositions) {
		if (string.endsWith("-")) {
			this.builder.append(string.substring(0, string.length() - 1));
		} else {
			this.builder.append(string);
			this.builder.append(" ");
		}
		this.textPositions.addAll(textPositions);
	}

	public PDRectangle getRectangle() {
		return this.textPositions.stream().map(this::asRectangle).reduce((a, b) -> this.union(a, b)).map(rectangle -> {
			rectangle.setLowerLeftX(rectangle.getLowerLeftX() - 5);
			rectangle.setLowerLeftY(rectangle.getLowerLeftY() - 5);
			rectangle.setUpperRightX(rectangle.getUpperRightX() + 5);
			rectangle.setUpperRightY(rectangle.getUpperRightY() + 5);
			return rectangle;
		}).get();
	}

	public int getPageIndex() {
		return this.pageIndex;
	}

	public String getText() {
		return this.builder.toString().trim();
	}

	public void setPage(int pageIndex, PDPage page) {
		this.pageIndex = pageIndex;
		this.page = page;
	}

	public PDPage getPage() {
		return this.page;
	}

	@Override
	public String toString() {
		return String.format("%d %s %s", this.pageIndex, this.getRectangle(), this.getText());
	}

	private PDRectangle asRectangle(TextPosition textPosition) {
		return new PDRectangle(textPosition.getX(), this.page.getMediaBox().getHeight() - textPosition.getY(),
				textPosition.getWidth(), textPosition.getHeight());
	}

	private PDRectangle union(PDRectangle a, PDRectangle b) {
		PDRectangle rectangle = new PDRectangle();
		rectangle.setLowerLeftX(Math.min(a.getLowerLeftX(), b.getLowerLeftX()));
		rectangle.setLowerLeftY(Math.min(a.getLowerLeftY(), b.getLowerLeftY()));
		rectangle.setUpperRightX(Math.max(a.getUpperRightX(), b.getUpperRightX()));
		rectangle.setUpperRightY(Math.max(a.getUpperRightY(), b.getUpperRightY()));
		return rectangle;
	}

}
