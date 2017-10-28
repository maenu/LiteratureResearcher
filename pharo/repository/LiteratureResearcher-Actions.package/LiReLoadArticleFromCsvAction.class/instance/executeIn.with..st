target resize
executeIn: aDictionary with: aNode
	| bibtex article edge |
	bibtex := (scholarPy getBibtex: (aDictionary at: #clusterId)) entries first.
	article := LiReArticle graph: aNode graph bibtex: bibtex metadata: nil.
	article mergeBibtexWithCsv: aDictionary.
	edge := self newEdgeWith: aDictionary source: article target: aNode.
	aNode graph nodes add: article.
	aNode graph edges add: edge