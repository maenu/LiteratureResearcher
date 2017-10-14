package ch.unibe.scg.pdflinker.clickable;

import java.awt.Color;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.stream.Collectors;

import ch.unibe.scg.pdflinker.Paragraph;

public abstract class AbstractClickable {

	protected String id;
	protected String key;
	protected Paragraph paragraph;

	public AbstractClickable(String id, String key) {
		this.id = id;
		this.key = key;
	}

	public String getId() {
		return this.id;
	}

	public String getKey() {
		return this.key;
	}

	public Paragraph getParagraph() {
		return this.paragraph;
	}

	public void setParagraph(Paragraph paragraph) {
		this.paragraph = paragraph;
	}

	public Color getColor() {
		return Color.LIGHT_GRAY;
	}

	public String asUri() {
		return String.format("pharo://LiRePdfLinkerUriHandler/%s?%s", this.getUriPath(), this.getUriQuery());
	}

	protected String getUriPath() {
		return this.getSelector().replace(":", ".");
	}

	protected String getUriQuery() {
		return String.join("&", this.getUriQueryParameters());
	}

	protected abstract String getSelector();

	protected List<String> getUriQueryParameters() {
		return this.getUriQueryParameterValues().stream().map(value -> "args=" + this.asUrlComponent(value))
				.collect(Collectors.toList());
	}

	protected abstract List<String> getUriQueryParameterValues();

	protected String asUrlComponent(String s) {
		if (s == null) {
			return "";
		}
		try {
			return URLEncoder.encode(s, StandardCharsets.UTF_8.name());
		} catch (UnsupportedEncodingException exception) {
			throw new RuntimeException(exception);
		}
	}

}
