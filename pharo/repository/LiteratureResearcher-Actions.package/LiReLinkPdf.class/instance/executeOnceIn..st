target resize
executeOnceIn: anArticle
	| result old new |
	old := self normalizeLinksSimplification: (self asLinksSimplification: anArticle).
	result := pdfLinker processPdf: anArticle bibtex key with: (self repositoryPdfOf: anArticle) links: old.
	self movePdf: (result at: #output) toRepositoryFor: anArticle.
	new := self normalizeLinksSimplification: (result at: #links).
	new = old
		ifTrue: [ ^ false ].
	self mergeLinks: (self fromLinksSimplification: new) in: anArticle.
	^ true