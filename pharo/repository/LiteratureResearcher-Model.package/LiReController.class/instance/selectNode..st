as yet unclassified
selectNode: aNode
	| element |
	(view attributes at: #GlamourContext) presentation selection: aNode.
	element := view elementFromModel: aNode.
	element announce: (TRMouseLeftClick shape: element trachelShape)