package ch.unibe.scg.pdflinker.dom;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.text.TextPosition;

public abstract class Node<P extends Node<?, ?>, C extends Node<?, ?>> {

	public static String union(String a, String seperator, String b) {
		return a + seperator + b;
	}

	public static PDRectangle union(PDRectangle a, PDRectangle b) {
		PDRectangle rectangle = new PDRectangle();
		rectangle.setLowerLeftX(Math.min(a.getLowerLeftX(), b.getLowerLeftX()));
		rectangle.setLowerLeftY(Math.min(a.getLowerLeftY(), b.getLowerLeftY()));
		rectangle.setUpperRightX(Math.max(a.getUpperRightX(), b.getUpperRightX()));
		rectangle.setUpperRightY(Math.max(a.getUpperRightY(), b.getUpperRightY()));
		return rectangle;
	}

	private Optional<P> parent;
	private List<C> children;
	private String seperator;

	public Node(Optional<P> parent, String seperator) {
		super();
		this.parent = parent;
		this.seperator = seperator;
		this.children = new ArrayList<>();
	}

	public void add(C child) {
		this.children.add(child);
	}

	public Optional<P> getParent() {
		return this.parent;
	}

	public List<C> getChildren() {
		return this.children;
	}

	public Optional<Node<?, ?>> getNodeContaining(TextPosition textPosition) {
		return (Optional<Node<?, ?>>) (Optional<?>) this.children.stream().map(c -> c.getNodeContaining(textPosition))
				.filter(Optional::isPresent).map(Optional::get).findFirst();
	}

	public Optional<Node<?, ?>> getNodeContainingAll(Collection<TextPosition> textPositions) {
		Optional<Node<?, ?>> child = (Optional<Node<?, ?>>) (Optional<?>) this.children.stream()
				.map(c -> c.getNodeContainingAll(textPositions)).filter(Optional::isPresent).map(Optional::get)
				.findFirst();
		if (child.isPresent()) {
			return child;
		}
		if (this.containsAll(textPositions)) {
			return Optional.of(this);
		}
		return Optional.empty();
	}

	public boolean contains(TextPosition textPosition) {
		return this.containsAll(Collections.singleton(textPosition));
	}

	public boolean containsAll(Collection<TextPosition> textPositions) {
		return textPositions.stream().allMatch(p -> this.children.stream().anyMatch(c -> c.contains(p)));
	}

	public PDRectangle getRectangle() {
		return this.children.stream().map(Node::getRectangle).reduce((a, b) -> union(a, b)).get();
	}

	public String getText() {
		return this.children.stream().map(Node::getText).reduce((a, b) -> union(a, this.seperator, b)).get();
	}

	@Override
	public String toString() {
		return this.getText();
	}

}
