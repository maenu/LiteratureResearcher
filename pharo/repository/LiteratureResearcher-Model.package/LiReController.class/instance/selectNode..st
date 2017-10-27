as yet unclassified
selectNode: aNode
	| element |
	element := view elementFromModel: aNode.
	element announce: (TRMouseLeftClick shape: element trachelShape)