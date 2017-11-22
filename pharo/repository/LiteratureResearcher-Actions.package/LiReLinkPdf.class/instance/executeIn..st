target resize
executeIn: anArticle
	| result links |
	result := pdfLinker processPdf: anArticle bibtex key with: (self repositoryPdfOf: anArticle) links: (self asLinksSimplification: anArticle).
	self movePdf: (result at: #output) toRepositoryFor: anArticle.
	links := self fromLinksSimplification: (result at: #links).
	(self isLinksEmpty: links)
		ifTrue: [ ^ self ].
	self mergeLinks: links in: anArticle.
	self executeIn: anArticle