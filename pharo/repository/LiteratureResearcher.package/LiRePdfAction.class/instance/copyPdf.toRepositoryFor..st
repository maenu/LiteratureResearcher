copying
copyPdf: aFileReference toRepositoryFor: anArticle
	| target |
	target := repository / (anArticle bibtex key , '.pdf').
	aFileReference moveTo: target.
	^ target