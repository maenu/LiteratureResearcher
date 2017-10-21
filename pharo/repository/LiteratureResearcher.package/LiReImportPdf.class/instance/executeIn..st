as yet unclassified
executeIn: anArticle
	| pdf cermineResult metadata bibtex generatedBibtex |
	"adapt article"
	"find or create authors"
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
	generatedBibtex := self generateBibtex: metadata.
	self mergeBibtex: anArticle bibtex: generatedBibtex metadata: metadata.
	self mergeAuthors: anArticle metadata: metadata.
	self mergeReferences: anArticle bibtex: bibtex metadata: metadata