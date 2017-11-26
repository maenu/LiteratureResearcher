announcements
whenEdgeRemovedDo: aBlock
	^ announcer when: LiReEdgeRemoved do: [ :a | aBlock cull: a ]