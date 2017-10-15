package ch.unibe.scg.pdflinker.clickable;

import java.awt.Color;
import java.util.Collections;
import java.util.List;

public class Title extends AbstractClickable {

	public Title(String id, String key) {
		super(id, key);
	}

	@Override
	public Color getColor() {
		return Color.LIGHT_GRAY;
	}

	@Override
	protected String getSelector() {
		return "clickTitleInId:";
	}

	@Override
	protected List<String> getUriQueryParameterValues() {
		return Collections.singletonList(this.id);
	}

}
