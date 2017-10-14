package ch.unibe.scg.pdflinker;

import java.awt.Color;
import java.util.ArrayList;
import java.util.List;

public class UnprocessedReference extends AbstractReference {

	protected String text;

	public UnprocessedReference(String key, String text) {
		super(key);
		this.text = text;
	}

	public String getText() {
		return this.text;
	}

	@Override
	public Color getColor() {
		return Color.LIGHT_GRAY;
	}

	@Override
	protected String getSelector() {
		return "id:key:text:paragraph:";
	}

	@Override
	protected List<String> getUriQueryParameterValues(String id) {
		List<String> values = new ArrayList<>();
		values.add(id);
		values.add(this.key);
		values.add(this.text);
		values.add(this.paragraph.getText().trim().substring(this.key.length()).trim());
		return values;
	}

}
