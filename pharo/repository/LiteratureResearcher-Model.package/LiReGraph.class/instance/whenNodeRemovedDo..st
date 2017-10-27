enumerating
whenNodeRemovedDo: aBlock
	^ announcer when: LiReNodeRemoved do: [ :a | aBlock cull: a ]