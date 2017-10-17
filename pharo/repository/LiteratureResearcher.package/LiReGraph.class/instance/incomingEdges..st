as yet unclassified
incomingEdges: aNode
	^ edges select: [ :e | e target = aNode ]