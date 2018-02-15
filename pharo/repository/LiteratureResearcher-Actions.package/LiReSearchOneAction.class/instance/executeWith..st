execution
executeWith: aCollection
	| article |
	article := aCollection at: 1.
	article mergeWith: (self executeWithArticle: article).
	^ article