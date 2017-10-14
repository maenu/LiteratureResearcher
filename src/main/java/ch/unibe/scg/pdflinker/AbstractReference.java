package ch.unibe.scg.pdflinker;

import java.awt.Color;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.stream.Collectors;

public abstract class AbstractReference {

	protected Paragraph paragraph;
	protected String key;

	public AbstractReference(String key) {
		this.key = key;
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

	public abstract Color getColor();

	public String asUri(String id) {
		return String.format("pharo://LiRePdfLinkerUriHandler/%s?%s", this.getUriPath(), this.getUriQuery(id));
	}

	protected String getUriPath() {
		return this.getSelector().replace(":", ".");
	}

	protected String getUriQuery(String id) {
		return String.join("&", this.getUriQueryParameters(id));
	}

	protected abstract String getSelector();

	protected List<String> getUriQueryParameters(String id) {
		return this.getUriQueryParameterValues(id).stream().map(value -> "args=" + this.asUrlComponent(value))
				.collect(Collectors.toList());
	}

	protected abstract List<String> getUriQueryParameterValues(String id);

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
