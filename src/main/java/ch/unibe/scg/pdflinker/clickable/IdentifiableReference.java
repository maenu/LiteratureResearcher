package ch.unibe.scg.pdflinker.clickable;

import java.awt.Color;
import java.util.ArrayList;
import java.util.List;

public class IdentifiableReference extends AbstractReference {

	protected String referencedId;
	protected Color color;

	public IdentifiableReference(String id, String key, String referencedId, Color color) {
		super(id, key);
		this.referencedId = referencedId;
		this.color = color;
	}

	public String getReferencedId() {
		return this.referencedId;
	}

	@Override
	public Color getColor() {
		return this.color;
	}

	@Override
	protected String getSelector() {
		return "clickReferenceInId:referencedId:";
	}

	@Override
	protected List<String> getUriQueryParameterValues() {
		List<String> values = new ArrayList<>();
		values.add(this.id);
		values.add(this.referencedId);
		return values;
	}

}
