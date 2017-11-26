accessing
incomingEdges: aNode
	^ edges select: [ :e | e target == aNode ]