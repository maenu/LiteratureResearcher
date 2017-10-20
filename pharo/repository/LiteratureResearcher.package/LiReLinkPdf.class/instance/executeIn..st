target resize
executeIn: anArticle
	| pdf |
	pdf := (anArticle bibtex hasField: #pdf)
		ifTrue: [ (anArticle bibtex at: #pdf) value asFileReference ]
		ifFalse: [ LiReActionError signal: 'No PDF provided, abort action.' ].
	pdf := pdfLinker
		processPdf: anArticle bibtex key
		with: pdf
		title: (self asTitleLink: anArticle)
		authors: (self asAuthorLinks: anArticle)
		references: (self asReferenceLinks: anArticle).
	pdf := self copyPdf: pdf toRepositoryFor: anArticle.
	anArticle bibtex at: #pdf put: pdf pathString