initialization
initialize
	self flag: 'use properties instead'.
	super initialize.
	repository := '../test/repository' asFileReference.
	pdfLinker := LiRePdfLinker subprocess: (LiReSubprocess command: '../pdf-linker.sh').
	cermine := LiReCermine subprocess: (LiReSubprocess command: '../cermine.sh').
	pdfdbscrap := LiRePdfdbscrap subprocess: (LiReSubprocess command: '../pdfdbscrap.sh').
	scholarPy := LiReScholarPy subprocess: (LiReSubprocess command: '../scholar.sh').
	pdfOpen := LiRePdfOpen subprocess: (LiReSubprocess command: '../pdf-open.sh').
	actionLoadPdf := LiReLoadPdf repository: repository pdfdbscrap: pdfdbscrap scholarPy: scholarPy.
	actionImportPdf := LiReImportPdf cermine: cermine.
	actionLinkPdf := LiReLinkPdf repository: repository pdfLinker: pdfLinker.
	actionOpenPdf := LiReOpenPdf pdfOpen: pdfOpen.
	actionMovePdf := LiReMovePdf repository: repository.
	actionLinkOpenPdf := LiReLinkOpenPdf link: actionLinkPdf open: actionOpenPdf.
	actionLoadImportLinkOpenPdf := LiReLoadImportLinkOpenPdf
		load: actionLoadPdf
		import: actionImportPdf
		link: actionLinkPdf
		open: actionOpenPdf.
	actionOpenWithAllOtherThingsNecessaryDoneBeforePdf := LiReOpenWithAllOtherThingsNecessaryDoneBeforePdf
		load: actionLoadPdf
		import: actionImportPdf
		link: actionLinkPdf
		open: actionOpenPdf.
	actionLoadReferencedByFromCsv := LiReLoadReferencedByFromCsv scholarPy: scholarPy.
	actionLoadWrittenByFromCsv := LiReLoadWrittenByFromCsv scholarPy: scholarPy.
	actionLoadArticleFromCsv := LiReLoadArticleFromCsv scholarPy: scholarPy