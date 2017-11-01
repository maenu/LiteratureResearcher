accessing
graph: anObject
	graph := anObject.
	view := graph asRoassalView.
	graph nodes do: [ :n | self addedNode: n ].
	graph edges do: [ :e | self addedEdge: e ].
	graph announcer
		when: LiReRequestScholarPy do: [ :r | self schedule: [ r block cull: scholarPy ] title: 'Searching on Scholar' ];
		when: LiReRequestSelectNode do: [ :r | self selectNode: r entity ];
		when: LiReRequestSelectEdge do: [ :r | self selectEdge: r entity ];
		when: LiReRequestLoadArticleFromCsv
			do: [ :r | self schedule: [ actionLoadArticleFromCsv executeIn: r csv with: r node ] title: 'Load article by from CSV' ].
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