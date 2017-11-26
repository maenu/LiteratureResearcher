accessing
edgesOfClass: anEdgeClass
	^ edges select: [ :e | e class == anEdgeClass ]