package ch.unibe.scg.pdflinker;

import java.awt.Color;
import java.util.ArrayList;
import java.util.List;

public class ProcessedReference extends AbstractReference {

	protected String id;
	protected Color color;

	public ProcessedReference(String key, String id, Color color) {
		super(key);
		this.id = id;
		this.color = color;
	}

	public String getId() {
		return this.id;
	}

	@Override
	public Color getColor() {
		return this.color;
	}

	@Override
	protected String getSelector() {
		return "id:referencedId:";
	}

	@Override
	protected List<String> getUriQueryParameterValues(String id) {
		List<String> values = new ArrayList<>();
		values.add(id);
		values.add(this.id);
		return values;
	}

}
