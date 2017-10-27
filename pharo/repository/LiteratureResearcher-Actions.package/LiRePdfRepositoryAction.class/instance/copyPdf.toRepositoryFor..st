copying
copyPdf: aFileReference toRepositoryFor: anArticle
	| target |
	target := repository / (anArticle bibtex key , '.pdf').
	anArticle bibtex at: #pdf put: target pathString.
	target absolutePath = aFileReference absolutePath
		ifTrue: [ ^ aFileReference ].
	target ensureDelete.
	aFileReference copyTo: target.
	^ target