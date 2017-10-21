copying
copyPdf: aFileReference toRepositoryFor: anArticle
	| target |
	target := repository / (anArticle bibtex key , '.pdf').
	target ensureDelete.
	aFileReference moveTo: target.
	^ target