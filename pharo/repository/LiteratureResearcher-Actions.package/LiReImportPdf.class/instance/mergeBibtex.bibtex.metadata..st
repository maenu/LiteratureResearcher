as yet unclassified
mergeBibtex: anArticle bibtex: generatedBibtex metadata: metadata
	anArticle metadata: metadata document.
	(generatedBibtex fields
		reject: [ :f | anArticle bibtex hasField: f key ])
		do: [ :f | 
			anArticle bibtex at: f key put: f rawValue.
			anArticle propertyChanged: #bibtex ]