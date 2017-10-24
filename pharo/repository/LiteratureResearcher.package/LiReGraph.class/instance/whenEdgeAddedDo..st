enumerating
whenEdgeAddedDo: aBlock
	^ announcer when: LiReEdgeAdded do: [ :a | aBlock cull: a ]