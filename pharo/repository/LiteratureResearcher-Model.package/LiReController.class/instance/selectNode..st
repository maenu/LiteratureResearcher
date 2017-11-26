selecting
selectNode: aNode
	| element |
	element := view elementFromModel: aNode.
	element announce: (TRMouseLeftClick shape: element trachelShape)