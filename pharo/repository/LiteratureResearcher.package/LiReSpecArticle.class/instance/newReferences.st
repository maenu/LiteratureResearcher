instance creation
newReferences
	| model |
	model := (self instantiate: LiReSpecEdges)
		title: 'References';
		yourself.
	model list displayBlock: [ :edge | edge asTargetWidget buildWithSpec ].
	model search results displayBlock: [ :node | node asCompactWidget buildWithSpec ].
	^ model