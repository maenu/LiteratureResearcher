instance creation
graph: aGraph
	| repository bin pdfLinker cermine pdfdbscrap scholarPy pdfOpen actionLoadPdf actionImportPdf actionLinkPdf actionOpenPdf actionMovePdf |
	repository := FileSystem workingDirectory / 'literature-researcher-repository'.
	bin := self gitRepository / 'bin'.
	pdfLinker := LiRePdfLinker subprocess: (LiReSubprocess command: bin / 'pdf-linker').
	cermine := LiReCermine subprocess: (LiReSubprocess command: bin / 'cermine').
	pdfdbscrap := LiRePdfdbscrap subprocess: (LiReSubprocess command: bin / 'pdfdbscrap').
	scholarPy := LiReScholarPy subprocess: (LiReSubprocess command: bin / 'scholar').
	pdfOpen := LiRePdfOpen subprocess: (LiReSubprocess command: bin / 'pdf-open').
	actionLoadPdf := LiReLoadPdf repository: repository pdfdbscrap: pdfdbscrap scholarPy: scholarPy.
	actionImportPdf := LiReImportPdf repository: repository cermine: cermine.
	actionLinkPdf := LiReLinkPdf repository: repository pdfLinker: pdfLinker.
	actionOpenPdf := LiReOpenPdf repository: repository pdfOpen: pdfOpen.
	actionMovePdf := LiReMovePdf repository: repository.
	^ self new
		graph: aGraph;
		scholarPy: scholarPy;
		actionLoadPdf: actionLoadPdf;
		actionImportPdf: actionImportPdf;
		actionLinkPdf: actionLinkPdf;
		actionOpenPdf: actionOpenPdf;
		actionMovePdf: actionMovePdf;
		yourself