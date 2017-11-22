package ch.unibe.scg.pdflinker.dom;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.text.TextPosition;

public abstract class Node<T extends Element> extends Element {

	public static String union(String a, String seperator, String b) {
		return a + seperator + b;
	}

	private List<T> children;
	private String seperator;

	public Node(String seperator) {
		super();
		this.seperator = seperator;
		this.children = new ArrayList<>();
	}

	public void add(T child) {
		this.children.add(child);
	}

	public List<T> getChildren() {
		return this.children;
	}

	@Override
	public Optional<Word> getWordContaining(TextPosition textPosition) {
		return this.children.stream().map(c -> c.getWordContaining(textPosition)).filter(Optional::isPresent)
				.map(Optional::get).findFirst();
	}

	@Override
	public Optional<Element> getElementContainingAll(Collection<TextPosition> textPositions) {
		Optional<Element> child = this.children.stream().map(c -> c.getElementContainingAll(textPositions))
				.filter(Optional::isPresent).map(Optional::get).findFirst();
		if (child.isPresent()) {
			return child;
		}
		if (this.containsAll(textPositions)) {
			return Optional.of(this);
		}
		return Optional.empty();
	}

	@Override
	public boolean contains(TextPosition textPosition) {
		return this.containsAll(Collections.singleton(textPosition));
	}

	@Override
	public boolean containsAll(Collection<TextPosition> textPositions) {
		return textPositions.stream().allMatch(p -> this.children.stream().anyMatch(c -> c.contains(p)));
	}

	@Override
	public PDRectangle getRectangle() {
		return this.children.stream().map(Element::getRectangle).reduce((a, b) -> union(a, b)).get();
	}

	@Override
	public String getText() {
		return this.children.stream().map(Element::getText).reduce((a, b) -> union(a, this.seperator, b)).get();
	}

}
