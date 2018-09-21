package ch.unibe.scg.pdflinker.dom;

import java.util.Optional;

public class Paragraph extends Node<Page, Line> {

	public Paragraph(Page parent) {
		super(Optional.of(parent), "\n");
	}

}
