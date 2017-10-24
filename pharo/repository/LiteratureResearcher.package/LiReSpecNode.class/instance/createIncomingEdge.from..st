as yet unclassified
createIncomingEdge: anEdgeClass from: aNode
	| edge |
	edge := anEdgeClass
		graph: entity graph
		source: aNode
		target: entity
		key: 'GENERATED'.
	entity graph edges add: edge.
	edge asWidget openWithSpec