target resize
executeIn: anArticle
	| pdf cermineResult metadata bibtex specModel |
	pdf := (anArticle bibtex hasField: #pdf)
		ifTrue: [ (anArticle bibtex at: #pdf) rawValueObject asFileReference ]
		ifFalse: [ (anArticle bibtex hasField: #url)
				ifTrue: [ pdfscrap processBibtex: anArticle bibtex ]
				ifFalse: [ self flag: 'request drag n drop if fails' ] ].
	pdf ifNil: [ LiReActionError signal: 'No PDF provided, abort action.' ].
	anArticle bibtex at: #pdf put: pdf pathString.
	self flag: 'copy pdf to repo'.
	cermineResult := cermine processPdf: anArticle bibtex key with: pdf outputs: {(LiReCermine outputJats , LiReCermine outputBibtex)}.
	metadata := LiReArticleMetadata fromJatsFile: (cermineResult at: LiReCermine outputJats).
	bibtex := (CZBibParser parse: (cermineResult at: LiReCermine outputBibtex) contents) entries.
	specModel := LiReArticleLoader article: anArticle metadata: metadata bibtex: bibtex.
	specModel openWithSpec.
	specModel window modalRelativeTo: World.
	self flag: 'open pdf'