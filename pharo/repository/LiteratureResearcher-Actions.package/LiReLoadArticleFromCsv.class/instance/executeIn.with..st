target resize
executeIn: aDictionary with: aNode
	| bibtex article |
	bibtex := (scholarPy getBibtex: (aDictionary at: #clusterId)) entries first.
	article := LiReArticle graph: aNode graph bibtex: bibtex document: nil.
	article mergeBibtexWithCsv: aDictionary.
	aNode graph nodes add: article.
	^ article