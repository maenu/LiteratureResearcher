package ch.unibe.scg.pdflinker.dom;

import java.util.Optional;

public class Line extends Node<Paragraph, Word> {

	public Line(Paragraph parent) {
		super(Optional.of(parent), " ");
	}

}
