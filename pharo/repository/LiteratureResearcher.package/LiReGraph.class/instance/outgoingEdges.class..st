as yet unclassified
outgoingEdges: aNode class: anEdgeClass
	^ edges select: [ :e | e class = anEdgeClass and: [ e source = aNode ] ]