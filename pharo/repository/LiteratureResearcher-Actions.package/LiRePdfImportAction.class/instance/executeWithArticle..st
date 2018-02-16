execution
executeWithArticle: anArticle
	| pdf cermineResult metadata bibtex |
	pdf := self repositoryPdfOf: anArticle.
	cermineResult := cermine
		processPdf: anArticle bibtex key
		with: pdf
		outputs:
			{LiReCermine outputJats.
			LiReCermine outputBibtex}.
	metadata := LiReCermineMetadata fromJatsFile: (cermineResult at: LiReCermine outputJats).
	bibtex := cermineResult at: LiReCermine outputBibtex.
	bibtex := LiReBibParser
		parse:
			(bibtex exists
				ifTrue: [ bibtex contents ]
				ifFalse: [ '' ]).
	anArticle mergeWith: (self newArticleWith: metadata).
	self mergeHasWritten: anArticle metadata: metadata.
	self mergeReferences: anArticle bibtex: bibtex metadata: metadata