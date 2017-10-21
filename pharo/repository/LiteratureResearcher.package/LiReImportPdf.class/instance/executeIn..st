target resize
executeIn: anArticle
	| pdf cermineResult metadata bibtex specModel generatedArticle |
	pdf := (anArticle bibtex hasField: #pdf)
		ifTrue: [ (anArticle bibtex at: #pdf) value asFileReference ]
		ifFalse: [ (anArticle bibtex hasField: #url)
				ifTrue: [ pdfscrap processBibtex: anArticle bibtex ]
				ifFalse: [ self flag: 'request drag n drop if fails' ] ].
	pdf ifNil: [ LiReActionError signal: 'No PDF provided, abort action.' ].
	pdf := self copyPdf: pdf toRepositoryFor: anArticle.
	anArticle bibtex at: #pdf put: pdf pathString.
	cermineResult := cermine
		processPdf: anArticle bibtex key
		with: pdf
		outputs:
			{LiReCermine outputJats.
			LiReCermine outputBibtex}.
	metadata := LiReCermineMetadata fromJatsFile: (cermineResult at: LiReCermine outputJats).
	bibtex := LiReBibParser parse: (cermineResult at: LiReCermine outputBibtex) contents.
	generatedArticle := self generateArticle: metadata.
	pdfOpen processPdf: pdf asFileReference.
	specModel := LiReArticleImporter
		article: anArticle
		generatedArticle: generatedArticle
		metadata: metadata
		bibtex: bibtex.
	specModel openWithSpec.
	specModel window modalRelativeTo: World