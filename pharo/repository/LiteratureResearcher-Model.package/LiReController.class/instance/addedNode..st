accessing
addedNode: aNode
	aNode announcer
		when: LiReRequestScholarPy do: [ :r | self schedule: [ r block cull: scholarPy ] title: 'Searching on Scholar' ];
		when: LiReRequestSelect do: [ :r | self selectNode: aNode ].
	(aNode isKindOf: LiReArticle)
		ifTrue: [ self addedArticle: aNode ].
	(aNode isKindOf: LiReAuthor)
		ifTrue: [ self addedAuthor: aNode ]