package ch.unibe.scg.pdflinker.dom;

import java.util.Optional;

public class Page extends Node<Node<?, ?>, Paragraph> {

	public Page() {
		super(Optional.empty(), "\r");
	}

}
