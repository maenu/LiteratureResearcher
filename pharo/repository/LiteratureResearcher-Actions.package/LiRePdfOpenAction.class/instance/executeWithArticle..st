execution
executeWithArticle: anArticle
	| pdf |
	pdf := self repositoryPdfOf: anArticle.
	pdfOpen processPdf: pdf