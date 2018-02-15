execution
executeWithArticle: anArticle
	(self executeOnceWith: anArticle)
		ifTrue: [ self executeOnceWith: anArticle ]