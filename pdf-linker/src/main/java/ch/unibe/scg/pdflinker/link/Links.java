package ch.unibe.scg.pdflinker.link;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class Links {

	private String id;
	private Optional<Title> title;
	private List<Author> authors;
	private List<Reference> references;

	public Links(String id) {
		this.id = id;
		this.title = Optional.empty();
		this.authors = new ArrayList<>();
		this.references = new ArrayList<>();
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Optional<Title> getTitle() {
		return this.title;
	}

	public void setTitle(Optional<Title> title) {
		this.title = title;
	}

	public List<Author> getAuthors() {
		return this.authors;
	}

	public void setAuthors(List<Author> authors) {
		this.authors = authors;
	}

	public List<Reference> getReferences() {
		return this.references;
	}

	public void setReferences(List<Reference> references) {
		this.references = references;
	}

}
