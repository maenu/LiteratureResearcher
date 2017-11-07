package ch.unibe.scg.pdflinker.dom;

import java.util.ArrayList;
import java.util.List;

import org.apache.pdfbox.pdmodel.common.PDRectangle;

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
		return children;
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
