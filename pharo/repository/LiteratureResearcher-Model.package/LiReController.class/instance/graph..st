accessing
graph: anObject
	graph := anObject.
	view := graph asRoassalView.
	graph nodes do: [ :n | self registerCallbacksForNode: n ].
	graph edges do: [ :e | self registerCallbacksForEdge: e ].
	graph announcer
		when: LiReNodeAdded do: [ :e | self registerCallbacksForNode: e node ];
		when: LiReEdgeAdded do: [ :e | self scheduleLayout ];
		when: LiReEdgeRemoved do: [ :e | self scheduleLayout ];
		when: LiReNodeAdded do: [ :e | self scheduleLayout ];
		when: LiReNodeRemoved do: [ :e | self scheduleLayout ].
	self scheduleLayout