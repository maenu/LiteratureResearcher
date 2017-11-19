removing
removeEdge: anEdge
	| edge |
	edge := view edgeFromModel: anEdge.
	RTLabeled removeLabelFrom: edge.
	edge remove