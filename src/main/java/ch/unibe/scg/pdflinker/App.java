package ch.unibe.scg.pdflinker;

import java.awt.Color;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.pdfbox.pdmodel.encryption.InvalidPasswordException;

import com.google.gson.Gson;

import ch.unibe.scg.pdflinker.clickable.Author;
import ch.unibe.scg.pdflinker.clickable.Reference;
import ch.unibe.scg.pdflinker.clickable.Title;

public class App {

	public static void main(String[] args) throws InvalidPasswordException, IOException {
		String id = args[0];
		(new Linker(id)).link(new File(args[1]), new File(args[2]), parse(Title.class, args[3]),
				parseAll(Author.class, args[4]), parseAll(Reference.class, args[5]));
	}

	private static <E> E parse(Class<E> cls, String s) {
		Map<String, Object> simplification = ((new Gson()).fromJson(s, HashMap.class));
		return asInstance(cls, simplification);
	}

	private static <E> List<E> parseAll(Class<E> cls, String s) {
		List<Map<String, Object>> simplifications = ((new Gson()).fromJson(s, ArrayList.class));
		simplifications.stream().map(simplification -> asInstance(cls, simplification)).collect(Collectors.toList());
		List<E> objects = new ArrayList<>();
		for (int i = 0; i < simplifications.size(); i = i + 1) {
			objects.add(asInstance(cls, simplifications.get(i)));
		}
		return objects;
	}

	private static <E> E asInstance(Class<E> cls, Map<String, Object> simplification) {
		try {
			List<Double> color = (List<Double>) simplification.get("color");
			return (E) cls.getConstructors()[0].newInstance(simplification.get("id"), simplification.get("key"),
					new Color(color.get(0).intValue(), color.get(1).intValue(), color.get(2).intValue()));
		} catch (InstantiationException | IllegalAccessException | IllegalArgumentException | InvocationTargetException
				| SecurityException exception) {
			throw new RuntimeException(exception);
		}
	}

}
