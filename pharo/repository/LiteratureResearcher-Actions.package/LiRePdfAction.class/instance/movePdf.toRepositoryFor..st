execution
movePdf: aFileReference toRepositoryFor: anArticle
	| target |
	repository asFileReference ensureCreateDirectory.
	target := repository / (anArticle bibtex key , '.pdf').
	target absolutePath = aFileReference absolutePath
		ifTrue: [ ^ aFileReference ].
	anArticle bibtex at: #pdf put: target basename.
	self flag: 'delete may not always be desired'.
	target ensureDelete.
	aFileReference moveTo: target.
	anArticle propertyChanged: #bibtex.
	^ target