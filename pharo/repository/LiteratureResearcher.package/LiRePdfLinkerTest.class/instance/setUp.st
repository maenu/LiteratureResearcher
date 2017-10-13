initialization
setUp
	workingDirectory := FileReference newTempFilePrefix: 'LiRePdfLinker' suffix: 'Test'.
	id := 'Osma16a'.
	keys := ((1 to: 35) collect: [ :i | '[' , i asString , ']' ]) asOrderedCollection.
	pdfLinker := LiRePdfLinker
		subprocess: (LiReSubprocess command: '../pdf-linker.sh')
		workingDirectory: (LiReSubprocessWorkingDirectory directory: workingDirectory).
	pdf := '../test/Osma16a.pdf' asFileReference