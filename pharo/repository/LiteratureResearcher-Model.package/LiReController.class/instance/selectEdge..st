as yet unclassified
selectEdge: anEdge
	| edge |
	edge := view edgeFromModel: anEdge.
	edge announce: (TRMouseLeftClick shape: edge trachelShape)