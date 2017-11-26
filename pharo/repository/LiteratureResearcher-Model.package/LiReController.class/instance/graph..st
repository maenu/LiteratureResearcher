accessing
graph: anObject
	graph := anObject.
	view := graph asRoassalView.
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
		when: LiReRequestMovePdf
			do: [ :a | 
			self
				schedule: [ actionMovePdf executeIn: a article.
					a then value ]
				title: 'Move PDF' ];
		when: LiReRequestOpenPdf
			do: [ :a | 
			self
				schedule: [ actionOpenPdf executeIn: a article.
					a then value ]
				title: 'Open PDF' ];
		when: LiReNodeAdded
			do: [ :a | 
			a node isCollection
				ifTrue: [ a node do: [ :e | self addNode: e ] ]
				ifFalse: [ self addNode: a node ].
			self scheduleLayout.
			a then value ];
		when: LiReNodeRemoved
			do: [ :a | 
			a node isCollection
				ifTrue: [ a node do: [ :e | self removeNode: e ] ]
				ifFalse: [ self removeNode: a node ].
			self scheduleLayout.
			a then value ];
		when: LiReEdgeAdded
			do: [ :a | 
			a edge isCollection
				ifTrue: [ a edge do: [ :e | self addEdge: e ] ]
				ifFalse: [ self addEdge: a edge ].
			self scheduleLayout.
			a then value ];
		when: LiReEdgeRemoved
			do: [ :a | 
			a edge isCollection
				ifTrue: [ a edge do: [ :e | self removeEdge: e ] ]
				ifFalse: [ self removeEdge: a edge ].
			self scheduleLayout.
			a then value ].
	self scheduleLayout