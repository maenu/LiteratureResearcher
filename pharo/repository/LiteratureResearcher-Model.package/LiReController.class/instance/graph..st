accessing
graph: anObject
	graph := anObject.
	view := graph asRoassalView.
	graph nodes do: [ :n | self addedNode: n ].
	graph edges do: [ :e | self addedEdge: e ].
	graph announcer
		when: LiReNodeAdded
			do: [ :e | 
			self addedNode: e node.
			self scheduleLayout ];
		when: LiReEdgeRemoved do: [ :e | self scheduleLayout ];
		when: LiReEdgeAdded
			do: [ :e | 
			self addedEdge: e edge.
			self scheduleLayout ];
		when: LiReNodeRemoved do: [ :e | self scheduleLayout ].
	self scheduleLayout