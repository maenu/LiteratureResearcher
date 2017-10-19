target resize
executeIn: anArticle
	| pdf xxx |
	pdf := (anArticle bibtex hasField: #pdf)
		ifTrue: [ (anArticle bibtex at: #pdf) value asFileReference ]
		ifFalse: [ LiReActionError signal: 'No PDF provided, abort action.' ].
	pdf := pdfLinker
		processPdf: anArticle bibtex key
		with: pdf
		title: xxx
		authors: xxx
		affiliations: xxx
		references: xxx.
	self flag: 'copy pdf to repo'.
	anArticle bibtex at: #pdf put: pdf pathString