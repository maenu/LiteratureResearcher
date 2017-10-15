package ch.unibe.scg.pdflinker.clickable;

import java.util.ArrayList;
import java.util.List;

public abstract class AbstractIndexedClickable extends AbstractClickable {

	protected int index;

	public AbstractIndexedClickable(String id, String key, int index) {
		super(id, key);
		this.index = index;
	}

	@Override
	protected String getSelector() {
		return "click" + this.getClass().getSimpleName() + "InId:index:";
	}

	@Override
	protected List<String> getUriQueryParameterValues() {
		List<String> values = new ArrayList<>();
		values.add(this.id);
		values.add(Integer.toString(this.index));
		return values;
	}

}
