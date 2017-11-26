execution
executeIn: anArticle
	| pdf |
	pdf := self repositoryPdfOf: anArticle.
	pdfOpen processPdf: pdf