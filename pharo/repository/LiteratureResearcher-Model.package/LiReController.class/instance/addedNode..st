accessing
addedNode: aNode
	aNode announcer
		when: LiReRequestScholarPy do: [ :r | self schedule: [ r block cull: scholarPy ] title: 'Searching on Scholar' ];
		when: LiReRequestSelectNode do: [ :r | self selectNode: r entity ].
	(aNode isKindOf: LiReArticle)
		ifTrue: [ self addedArticle: aNode ].
	(aNode isKindOf: LiReAuthor)
		ifTrue: [ self addedAuthor: aNode ]