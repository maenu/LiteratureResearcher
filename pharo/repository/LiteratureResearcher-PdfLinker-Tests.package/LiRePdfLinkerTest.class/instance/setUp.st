initialization
setUp
	id := 'Osma16a'.
	title := 'Tracking Null Checks in Open-Source Java Systems'.
	authors := {'Haidar Osman' . 'Manuel Leuenberger' . 'Mircea Lungu' . 'Oscar Nierstrasz'}.
	affiliations := {'SCG, University of Bern' . 'University of Bern' . 'University of Groningen'}.
	references := {{(#referencedId -> 'asdf').
	(#key -> '[2]').
	(#color -> {127 . 7 . 0})} asDictionary.
	{(#key -> '[3]').
	(#text -> 'text 3 text').
	(#bibtex -> '@inproceedings{ref3,title={some title 3}}')} asDictionary} asOrderedCollection.
	pdfLinker := LiRePdfLinker subprocess: (LiReSubprocess command: '../pdf-linker.sh').
	pdf := '../test/Osma16a.pdf' asFileReference