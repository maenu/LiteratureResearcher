copying
copyPdf: aFileReference toRepositoryFor: anArticle
	| target |
	target := repository / (anArticle bibtex key , '.pdf').
	anArticle bibtex at: #pdf put: target pathString.
	target = aFileReference
		ifTrue: [ ^ aFileReference ].
	target ensureDelete.
	aFileReference copyTo: target.
	^ target