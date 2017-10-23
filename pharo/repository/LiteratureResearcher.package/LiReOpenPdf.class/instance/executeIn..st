as yet unclassified
executeIn: anArticle
	pdfOpen processPdf: (anArticle bibtex at: #pdf) value asFileReference