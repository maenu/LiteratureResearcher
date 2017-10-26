initialization
initialize
	super initialize.
	repository := '../test/repository' asFileReference.
	pdfLinker := LiRePdfLinker
		subprocess: (LiReSubprocess command: '../pdf-linker.sh').
	cermine := LiReCermine
		subprocess: (LiReSubprocess command: '../cermine.sh').
	pdfscrap := LiRePdfscrap
		subprocess: (LiReSubprocess command: '../pdfscrap.sh').
	scholarPy := LiReScholarPy
		subprocess: (LiReSubprocess command: '../scholar.sh').
	pdfOpen := LiRePdfOpen
		subprocess: (LiReSubprocess command: '../pdf-open.sh').
	actionImportPdf := LiReImportPdf cermine: cermine.
	actionLinkPdf := LiReLinkPdf
		repository: repository
		pdfLinker: pdfLinker.
	actionLoadPdf := LiReLoadPdf
		repository: repository
		pdfscrap: pdfscrap
		scholarPy: scholarPy.
	actionOpenPdf := LiReOpenPdf pdfOpen: pdfOpen