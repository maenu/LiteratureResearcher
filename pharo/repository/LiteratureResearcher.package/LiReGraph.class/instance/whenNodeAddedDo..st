enumerating
whenNodeAddedDo: aBlock
	^ announcer when: LiReNodeAdded do: [ :a | aBlock cull: a ]