selecting
selectEdge: anEdge
	| edge |
	anEdge hidden
		ifTrue: [ anEdge source hidden: false.
			anEdge target hidden: false ].
	self assert: [ anEdge hidden not ].
	edge := view edgeFromModel: anEdge.
	edge announce: (TRMouseLeftClick shape: edge trachelShape)