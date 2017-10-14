package ch.unibe.scg.pdflinker;

import java.awt.Color;
import java.util.ArrayList;
import java.util.List;

public class UnprocessedReference extends AbstractReference {

	protected String text;
	protected String bibtex;

	public UnprocessedReference(String key, String text, String bibtex) {
		super(key);
		this.text = text;
		this.bibtex = bibtex;
	}

	public String getText() {
		return this.text;
	}

	public String getBibtex() {
		return this.bibtex;
	}

	@Override
	public Color getColor() {
		return Color.LIGHT_GRAY;
	}

	@Override
	protected String getSelector() {
		return "id:key:text:paragraph:bibtex:";
	}

	@Override
	protected List<String> getUriQueryParameterValues(String id) {
		List<String> values = new ArrayList<>();
		values.add(id);
		values.add(this.key);
		values.add(this.text);
		values.add(this.paragraph.getText().trim().substring(this.key.length()).trim());
		values.add(this.bibtex);
		return values;
	}

}
