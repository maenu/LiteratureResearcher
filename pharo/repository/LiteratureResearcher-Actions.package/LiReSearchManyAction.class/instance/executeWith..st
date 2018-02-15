execution
executeWith: aCollection
	^ (self executeWith: (aCollection at: 1) start: (aCollection at: 2) count: (aCollection at: 3))
		collect: [ :d | 
			| article |
			article := self newArticleWith: d.
			(controller graph nodesOfClass: LiReArticle)
				detect: [ :n | n matches: (article bibtex at: #title) value ]
				ifFound: [ :n | n mergeWith: article ]
				ifNone: [ article graph: controller graph.
					controller graph nodes add: article.
					article ] ]