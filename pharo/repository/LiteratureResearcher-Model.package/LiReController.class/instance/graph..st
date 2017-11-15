accessing
graph: anObject
	graph := anObject.
	view := graph asRoassalView.
	graph nodes do: [ :n | self addedNode: n ].
	graph edges do: [ :e | self addedEdge: e ].
	graph announcer
		when: LiReRequestSelectNode
			do: [ :a | 
			self selectNode: a entity.
			a then value ];
		when: LiReRequestSelectEdge
			do: [ :a | 
			self selectEdge: a entity.
			a then value ];
		when: LiReRequestScholarPy
			do: [ :a | 
			self
				schedule: [ a block cull: scholarPy.
					a then value ]
				title: 'Searching on Scholar' ];
		when: LiReRequestLoadPdf
			do: [ :a | 
			self
				schedule: [ actionLoadPdf executeIn: a article.
					a then value ]
				title: 'Load PDF' ];
		when: LiReRequestImportPdf
			do: [ :a | 
			self
				schedule: [ actionImportPdf executeIn: a article.
					a then value ]
				title: 'Import PDF' ];
		when: LiReRequestLinkPdf
			do: [ :a | 
			self
				schedule: [ actionLinkPdf executeIn: a article.
					a then value ]
				title: 'Link PDF' ];
		when: LiReRequestOpenPdf
			do: [ :a | 
			self
				schedule: [ actionOpenPdf executeIn: a article.
					a then value ]
				title: 'Open PDF' ].
	graph announcer
		when: LiReNodeAdded
			do: [ :a | 
			self addedNode: a node.
			self scheduleLayout.
			a then value ];
		when: LiReEdgeRemoved
			do: [ :a | 
			self scheduleLayout.
			a then value ];
		when: LiReEdgeAdded
			do: [ :a | 
			self addedEdge: a edge.
			self scheduleLayout.
			a then value ];
		when: LiReNodeRemoved
			do: [ :a | 
			self scheduleLayout.
			a then value ].
	self scheduleLayout