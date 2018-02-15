instance creation
toolsWithBin: aFileReference
	| pdfLinker cermine pdfdbscrap scholarPy pdfOpen |
	pdfLinker := LiRePdfLinker subprocess: (LiReSubprocess command: aFileReference / 'pdf-linker').
	cermine := LiReCermine subprocess: (LiReSubprocess command: aFileReference / 'cermine').
	pdfdbscrap := LiRePdfdbscrap subprocess: (LiReSubprocess command: aFileReference / 'pdfdbscrap').
	scholarPy := LiReScholarPy subprocess: (LiReSubprocess command: aFileReference / 'scholar').
	pdfOpen := LiRePdfOpen subprocess: (LiReSubprocess command: aFileReference / 'pdf-open').
	^ {(LiRePdfLinker -> pdfLinker).
	(LiReCermine -> cermine).
	(LiRePdfdbscrap -> pdfdbscrap).
	(LiReScholarPy -> scholarPy).
	(LiRePdfOpen -> pdfOpen)} asDictionary