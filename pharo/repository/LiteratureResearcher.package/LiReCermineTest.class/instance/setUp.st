initialization
setUp
	outputs := {'jats' . 'text' . 'bibtex'}.
	cermine := LiReCermine subprocess: (LiReSubprocess command: '../cermine.sh').
	id := 'asdf'.
	pdf := '../test/Osma16a.pdf' asFileReference