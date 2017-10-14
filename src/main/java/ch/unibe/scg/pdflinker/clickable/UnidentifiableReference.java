package ch.unibe.scg.pdflinker.clickable;

import java.util.ArrayList;
import java.util.List;

public class UnidentifiableReference extends AbstractReference {

	protected String text;
	protected String bibtex;

	public UnidentifiableReference(String id, String key, String text, String bibtex) {
		super(id, key);
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
	protected String getSelector() {
		return "clickReferenceInId:key:text:paragraph:bibtex:";
	}

	@Override
	protected List<String> getUriQueryParameterValues() {
		List<String> values = new ArrayList<>();
		values.add(this.id);
		values.add(this.key);
		values.add(this.text);
		values.add(this.paragraph.getText().trim().substring(this.key.length()).trim());
		values.add(this.bibtex);
		return values;
	}

}
