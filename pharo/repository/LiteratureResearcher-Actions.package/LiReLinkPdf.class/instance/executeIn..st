execution
executeIn: anArticle
	(self executeOnceIn: anArticle)
		ifTrue: [ self executeOnceIn: anArticle ]