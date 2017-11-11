target resize
executeIn: anArticle
	| pdf |
	pdf := (anArticle bibtex hasField: #pdf)
		ifTrue: [ (anArticle bibtex at: #pdf) value asFileReference ]
		ifFalse: [ LiReActionError signal: 'No PDF provided, abort action.' ].
	pdf := pdfLinker
		processPdf: anArticle bibtex key
		with: repository / pdf
		title: (self asTitleLink: anArticle)
		authors: (self asAuthorLinks: anArticle)
		references: (self asReferenceLinks: anArticle).
	pdf := self movePdf: pdf toRepositoryFor: anArticle