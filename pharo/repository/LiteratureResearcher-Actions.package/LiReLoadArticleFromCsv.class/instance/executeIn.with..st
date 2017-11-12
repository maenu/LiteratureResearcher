target resize
executeIn: aDictionary with: aNode
	| bibtex article |
	bibtex := (scholarPy getBibtex: (aDictionary at: #clusterId)) entries first.
	article := LiReArticle graph: aNode graph bibtex: bibtex csv: Dictionary new document: nil.
	article mergeCsv: aDictionary.
	aNode graph nodes add: article.
	^ article