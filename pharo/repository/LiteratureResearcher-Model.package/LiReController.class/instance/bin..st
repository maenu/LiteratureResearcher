accessing
bin: aFileReference
	bin := aFileReference.
	pdfLinker := LiRePdfLinker subprocess: (LiReSubprocess command: (bin / 'pdf-linker') pathString).
	cermine := LiReCermine subprocess: (LiReSubprocess command: (bin / 'cermine') pathString).
	pdfdbscrap := LiRePdfdbscrap subprocess: (LiReSubprocess command: (bin / 'pdfdbscrap') pathString).
	scholarPy := LiReScholarPy subprocess: (LiReSubprocess command: (bin / 'scholar') pathString).
	pdfOpen := LiRePdfOpen subprocess: (LiReSubprocess command: (bin / 'pdf-open') pathString).
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