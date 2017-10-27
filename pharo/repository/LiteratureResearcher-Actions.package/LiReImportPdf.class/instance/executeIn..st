as yet unclassified
executeIn: anArticle
	| pdf cermineResult metadata bibtex generatedBibtex |
	pdf := (anArticle bibtex at: #pdf) value asFileReference.
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