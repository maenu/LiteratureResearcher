target resize
executeIn: aModel
	| pdf cermineResult metadata xxx bibtex |
	pdf := (article bibtex hasField: #pdf)
		ifTrue: [ (article bibtex at: #pdf) rawValueObject asFileReference ]
		ifFalse: [ (article bibtex hasField: #url)
				ifTrue: [ pdfscrap processBibtex: article bibtex ]
				ifFalse: [ self flag: 'request drag n drop if fails' ] ].
	pdf ifNil: [ LiReActionError signal: 'No PDF provided, abort action.' ].
	cermineResult := cermine processPdf: article bibtex key with: pdf outputs: {(LiReCermine outputJats , LiReCermine outputBibtex)}.
	metadata := LiReArticleMetadata fromJatsFile: (cermineResult at: LiReCermine outputJats).
	bibtex := (CZBibParser parse: (cermineResult at: LiReCermine outputBibtex) contents) entries.
	self flag: 'open pdf, metadata for article'.
	self flag: 'open bibtex for references'.
	pdf := pdfLinker
		processPdf: article bibtex key
		with: pdf
		title: xxx
		authors: xxx
		affiliations: xxx
		references: xxx.
	self flag: 'copy pdf to repo'.
	article bibtex at: #pdf put: pdf pathString