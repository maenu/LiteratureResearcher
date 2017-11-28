package ch.unibe.scg.pdflinker.link;

import java.awt.Color;
import java.util.Optional;

import org.apache.pdfbox.pdmodel.common.PDRectangle;

public class Reference extends Link {

	public Reference(String key, Optional<String> id, Optional<String> text, Optional<Integer> page,
			Optional<PDRectangle> rectangle, Optional<Color> color) {
		super(key, id, text, page, rectangle, color);
	}

}
