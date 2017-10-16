instance creation
newAuthors
	| model |
	model := (self instantiate: LiReSpecEdges)
		title: 'Authors';
		yourself.
	model list displayBlock: [ :edge | edge asSourceWidget buildWithSpec ].
	model search results displayBlock: [ :node | node asCompactWidget buildWithSpec ].
	^ model