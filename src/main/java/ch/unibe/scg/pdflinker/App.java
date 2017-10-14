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

public class App {

	public static void main(String[] args) throws InvalidPasswordException, IOException {
		(new Linker()).link(args[0], new File(args[1]), new File(args[2]),
				((List<Map<String, Object>>) (new Gson()).fromJson(args[3], ArrayList.class)).stream().map(map -> {
					if (map.containsKey("id")) {
						List<Double> parts = (List<Double>) map.get("color");
						return new ProcessedReference((String) map.get("key"), (String) map.get("id"), new Color(
								parts.get(0).intValue(), parts.get(1).intValue(), parts.get(2).intValue(), 31));
					} else {
						return new UnprocessedReference((String) map.get("key"), (String) map.get("text"));
					}
				}).collect(Collectors.toList()));
	}

}
