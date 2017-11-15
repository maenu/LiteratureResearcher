accessing
graph: anObject
	graph := anObject.
	view := graph asRoassalView.
	graph nodes do: [ :n | self addedNode: n ].
	graph edges do: [ :e | self addedEdge: e ].
	graph announcer
		when: LiReRequestSelectNode do: [ :r | self selectNode: r entity ];
		when: LiReRequestSelectEdge do: [ :r | self selectEdge: r entity ];
		when: LiReRequestScholarPy do: [ :r | self schedule: [ r block cull: scholarPy ] title: 'Searching on Scholar' ];
		when: LiReRequestLoadPdf do: [ :r | self schedule: [ actionLoadPdf executeIn: r article ] title: 'Load PDF' ];
		when: LiReRequestImportPdf do: [ :r | self schedule: [ actionImportPdf executeIn: r article ] title: 'Import PDF' ];
		when: LiReRequestLinkPdf do: [ :r | self schedule: [ actionLinkPdf executeIn: r article ] title: 'Link PDF' ];
		when: LiReRequestOpenPdf do: [ :r | self schedule: [ actionOpenPdf executeIn: r article ] title: 'Open PDF' ].
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