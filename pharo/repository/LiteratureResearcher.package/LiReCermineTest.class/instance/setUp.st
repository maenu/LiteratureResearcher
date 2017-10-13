initialization
setUp
	workingDirectory := FileReference newTempFilePrefix: 'LiReCermine' suffix: 'Test'.
	outputs := {'jats' . 'text' . 'bibtex'}.
	cermine := LiReCermine
		subprocess: (LiReSubprocess command: '../cermine.sh')
		workingDirectory: (LiReSubprocessWorkingDirectory directory: workingDirectory)
		outputs: outputs.
	id := 'asdf'.
	pdf := '../test/Osma16a.pdf' asFileReference