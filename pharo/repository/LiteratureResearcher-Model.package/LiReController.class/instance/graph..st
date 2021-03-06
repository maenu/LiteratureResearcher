accessing
graph: anObject
	graph := anObject.
	view := graph asRoassalView.
	graph announcer
		when: LiReRequestSelectNode do: [ :a | a resolve: [ self selectNode: a entity ] ];
		when: LiReRequestSelectEdge do: [ :a | a resolve: [ self selectEdge: a entity ] ];
		when: LiReRequestSearchOneBibtex
			do: [ :a | self schedule: [ a resolve: [ (actions at: LiReSearchOneBibtexAction) executeWith: {a object} ] ] title: 'Search one BibTex' ];
		when: LiReRequestSearchOneClusterId
			do: [ :a | self schedule: [ a resolve: [ (actions at: LiReSearchOneClusterIdAction) executeWith: {a object} ] ] title: 'Search one cluster ID' ];
		when: LiReRequestSearchManyByAny
			do: [ :a | 
			self
				schedule: [ a
						resolve: [ (actions at: LiReSearchManyByAnyAction)
								executeWith:
									{a object.
									a start.
									a count} ] ]
				title: 'Search many by any' ];
		when: LiReRequestSearchManyByAuthors
			do: [ :a | 
			self
				schedule: [ a
						resolve: [ (actions at: LiReSearchManyByAuthorsAction)
								executeWith:
									{a object.
									a start.
									a count} ] ]
				title: 'Search many by authors' ];
		when: LiReRequestSearchManyByTitle
			do: [ :a | 
			self
				schedule: [ a
						resolve: [ (actions at: LiReSearchManyByTitleAction)
								executeWith:
									{a object.
									a start.
									a count} ] ]
				title: 'Search many by title' ];
		when: LiReRequestSearchManyCitations
			do: [ :a | 
			self
				schedule: [ a
						resolve: [ (actions at: LiReSearchManyCitationsAction)
								executeWith:
									{a object.
									a start.
									a count} ] ]
				title: 'Search many citations' ];
		when: LiReRequestPdfLoad do: [ :a | self schedule: [ a resolve: [ (actions at: LiRePdfLoadAction) executeWith: {a article} ] ] title: 'Load PDF' ];
		when: LiReRequestPdfImport
			do: [ :a | self schedule: [ a resolve: [ (actions at: LiRePdfImportAction) executeWith: {a article} ] ] title: 'Import PDF' ];
		when: LiReRequestPdfLink do: [ :a | self schedule: [ a resolve: [ (actions at: LiRePdfLinkAction) executeWith: {a article} ] ] title: 'Link PDF' ];
		when: LiReRequestPdfMove do: [ :a | self schedule: [ a resolve: [ (actions at: LiRePdfMoveAction) executeWith: {a article} ] ] title: 'Move PDF' ];
		when: LiReRequestPdfOpen do: [ :a | self schedule: [ a resolve: [ (actions at: LiRePdfOpenAction) executeWith: {a article} ] ] title: 'Open PDF' ];
		when: LiReNodeAdded
			do: [ :a | 
			a
				resolve: [ a node isCollection
						ifTrue: [ a node do: [ :e | self addNode: e ] ]
						ifFalse: [ self addNode: a node ].
					self scheduleLayout.
					a node ] ];
		when: LiReNodeRemoved
			do: [ :a | 
			a
				resolve: [ a node isCollection
						ifTrue: [ a node do: [ :e | self removeNode: e ] ]
						ifFalse: [ self removeNode: a node ].
					self scheduleLayout.
					a node ] ];
		when: LiReEdgeAdded
			do: [ :a | 
			a
				resolve: [ a edge isCollection
						ifTrue: [ a edge do: [ :e | self addEdge: e ] ]
						ifFalse: [ self addEdge: a edge ].
					self scheduleLayout.
					a edge ] ];
		when: LiReEdgeRemoved
			do: [ :a | 
			a
				resolve: [ a edge isCollection
						ifTrue: [ a edge do: [ :e | self removeEdge: e ] ]
						ifFalse: [ self removeEdge: a edge ].
					self scheduleLayout.
					a edge ] ];
		when: LiReNodeHidden
			do: [ :a | 
			a
				resolve: [ a node isCollection
						ifTrue: [ a node do: [ :e | self hideNode: e ] ]
						ifFalse: [ self hideNode: a node ].
					self scheduleLayout.
					a node ] ];
		when: LiReNodeShown
			do: [ :a | 
			a
				resolve: [ a node isCollection
						ifTrue: [ a node do: [ :e | self showNode: e ] ]
						ifFalse: [ self showNode: a node ].
					self scheduleLayout.
					a node ] ].
	self scheduleLayout