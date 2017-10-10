package ch.unibe.scg.pdflinker;

import java.io.File;
import java.io.IOException;

import org.apache.pdfbox.pdmodel.encryption.InvalidPasswordException;

public class App {

	public static void main(String[] args) throws InvalidPasswordException, IOException {
		(new Linker()).link(new File(args[0]), new File(args[1]));
	}

}
