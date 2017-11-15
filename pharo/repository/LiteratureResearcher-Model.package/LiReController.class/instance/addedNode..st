notifying
addedNode: aNode
	(aNode isKindOf: LiReArticle)
		ifTrue: [ self addedArticle: aNode ].
	(aNode isKindOf: LiReAuthor)
		ifTrue: [ self addedAuthor: aNode ]