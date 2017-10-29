target resize
executeIn: anArticle
	| pdf |
	pdf := (anArticle bibtex hasField: #pdf)
		ifTrue: [ (anArticle bibtex at: #pdf) value asFileReference ]
		ifFalse: [ LiReActionError signal: 'No PDF provided, abort action.' ].
	pdf := self movePdf: pdf toRepositoryFor: anArticle