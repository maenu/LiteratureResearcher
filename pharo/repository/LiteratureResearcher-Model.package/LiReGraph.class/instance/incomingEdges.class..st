accessing
incomingEdges: aNode class: anEdgeClass
	^ edges select: [ :e | e class == anEdgeClass and: [ e target == aNode ] ]