package ch.unibe.scg.pdflinker;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.pdfbox.pdmodel.encryption.InvalidPasswordException;

public class App {

	public static void main(String[] args) throws InvalidPasswordException, IOException {
		try (CSVParser parser = CSVParser.parse(args[3], CSVFormat.DEFAULT)) {
			List<String> keys = StreamSupport.stream(parser.getRecords().get(0).spliterator(), false)
					.collect(Collectors.toList());
			(new Linker()).link(args[0], new File(args[1]), new File(args[2]), keys);
		}
	}

}
