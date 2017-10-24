as yet unclassified
createOutgoingEdge: anEdgeClass to: aNode
	| edge |
	edge := anEdgeClass
		graph: entity graph
		source: entity
		target: aNode
		key: 'GENERATED'.
	entity graph edges add: edge.
	edge asWidget openWithSpec