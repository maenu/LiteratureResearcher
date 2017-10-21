as yet unclassified
article: anArticle generatedArticle: anotherArticle metadata: aMetadata bibtex: aBibtex
	^ self basicNew
		article: anArticle;
		generatedArticle: anotherArticle;
		metadata: aMetadata;
		bibtex: aBibtex;
		initialize;
		yourself