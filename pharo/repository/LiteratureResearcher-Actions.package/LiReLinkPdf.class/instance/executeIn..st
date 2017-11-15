target resize
executeIn: anArticle
	| pdf |
	pdf := self repositoryPdfOf: anArticle.
	pdf := pdfLinker
		processPdf: anArticle bibtex key
		with: pdf
		title: (self asTitleLink: anArticle)
		authors: (self asAuthorLinks: anArticle)
		references: (self asReferenceLinks: anArticle).
	pdf := self movePdf: pdf toRepositoryFor: anArticle