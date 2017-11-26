accessing
outgoingEdges: aNode
	^ edges select: [ :e | e source == aNode ]