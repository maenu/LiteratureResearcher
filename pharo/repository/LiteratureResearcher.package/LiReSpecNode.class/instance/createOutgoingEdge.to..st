as yet unclassified
createOutgoingEdge: anEdgeClass to: aNode
	| edge |
	edge := anEdgeClass
		graph: entity graph
		key: 'GENERATED'
		source: entity
		target: aNode.
	entity graph edges add: edge.
	edge asWidget openWithSpec