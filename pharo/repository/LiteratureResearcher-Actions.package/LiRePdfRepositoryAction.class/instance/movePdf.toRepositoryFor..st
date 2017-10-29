copying
movePdf: aFileReference toRepositoryFor: anArticle
	| target |
	target := repository / (anArticle bibtex key , '.pdf').
	target absolutePath = aFileReference absolutePath
		ifTrue: [ ^ aFileReference ].
	anArticle bibtex at: #pdf put: target pathString.
	anArticle propertyChanged: #bibtex.
	target ensureDelete.
	aFileReference moveTo: target.
	^ target