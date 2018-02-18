selecting
selectNode: aNode
	| element |
	aNode hidden
		ifTrue: [ aNode hidden: false ].
	self assert: [ aNode hidden not ].
	element := view elementFromModel: aNode.
	element announce: (TRMouseLeftClick shape: element trachelShape)