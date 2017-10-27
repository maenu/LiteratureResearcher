as yet unclassified
outgoingEdges: aNode
	^ edges select: [ :e | e source == aNode ]