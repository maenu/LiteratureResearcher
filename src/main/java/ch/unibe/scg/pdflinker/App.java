package ch.unibe.scg.pdflinker;

import java.awt.Color;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.pdfbox.pdmodel.encryption.InvalidPasswordException;

import com.google.gson.Gson;

import ch.unibe.scg.pdflinker.clickable.AbstractReference;
import ch.unibe.scg.pdflinker.clickable.Affiliation;
import ch.unibe.scg.pdflinker.clickable.Author;
import ch.unibe.scg.pdflinker.clickable.IdentifiableReference;
import ch.unibe.scg.pdflinker.clickable.Title;
import ch.unibe.scg.pdflinker.clickable.UnidentifiableReference;

public class App {

	public static void main(String[] args) throws InvalidPasswordException, IOException {
		String id = args[0];
		(new Linker()).link(new File(args[1]), new File(args[2]), asTitle(id, args[3]), asAuthors(id, args[4]),
				asAffiliations(id, args[5]), asReferences(id, args[6]));
	}

	private static Title asTitle(String id, String s) {
		return new Title(id, s);
	}

	private static List<Author> asAuthors(String id, String s) {
		List<String> objects = ((new Gson()).fromJson(s, ArrayList.class));
		List<Author> authors = new ArrayList<>();
		for (int i = 0; i < objects.size(); i = i + 1) {
			authors.add(new Author(id, objects.get(i), i));
		}
		return authors;
	}

	private static List<Affiliation> asAffiliations(String id, String s) {
		List<String> objects = ((new Gson()).fromJson(s, ArrayList.class));
		List<Affiliation> affiliations = new ArrayList<>();
		for (int i = 0; i < objects.size(); i = i + 1) {
			affiliations.add(new Affiliation(id, objects.get(i), i));
		}
		return affiliations;
	}

	private static List<AbstractReference> asReferences(String id, String s) {
		return ((List<Map<String, Object>>) (new Gson()).fromJson(s, ArrayList.class)).stream().map(map -> {
			if (map.containsKey("referencedId")) {
				List<Double> parts = (List<Double>) map.get("color");
				return new IdentifiableReference(id, (String) map.get("key"), (String) map.get("referencedId"),
						new Color(parts.get(0).intValue(), parts.get(1).intValue(), parts.get(2).intValue(), 31));
			} else {
				return new UnidentifiableReference(id, (String) map.get("key"), (String) map.get("text"),
						(String) map.get("bibtex"));
			}
		}).collect(Collectors.toList());
	}

}
