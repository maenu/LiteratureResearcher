package ch.unibe.scg.pdflinker;

import java.io.IOException;
import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.pdfbox.text.PDFTextStripperByArea;
import org.apache.pdfbox.text.TextPosition;

public class RegionTextExtrator extends PDFTextStripperByArea {

	public RegionTextExtrator() throws IOException {
		super();
	}

	public List<TextPosition> getTextPositions(String regionName) {
		List<List<TextPosition>> textPositions = this.getRegionCharacterList().get(regionName);
		return textPositions.stream().flatMap(l -> l.stream()).collect(Collectors.toList());
	}

	private Map<String, List<List<TextPosition>>> getRegionCharacterList() {
		try {
			Field field = PDFTextStripperByArea.class.getDeclaredField("regionCharacterList");
			field.setAccessible(true);
			return (Map<String, List<List<TextPosition>>>) field.get(this);
		} catch (NoSuchFieldException | SecurityException | IllegalArgumentException | IllegalAccessException e) {
			throw new RuntimeException(e);
		}
	}

}
