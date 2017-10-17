as yet unclassified
createIncomingEdge: anEdgeClass from: aNode
	| edge |
	edge := anEdgeClass
		graph: entity graph
		key: 'GENERATED'
		source: aNode
		target: entity.
	entity graph edges add: edge.
	edge asWidget openWithSpec