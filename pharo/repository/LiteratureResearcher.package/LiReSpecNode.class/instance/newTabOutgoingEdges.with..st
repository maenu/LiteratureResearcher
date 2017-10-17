instance creation
newTabOutgoingEdges: anEdgeClass with: aCollection
	| tab |
	tab := self instantiate: LiReSpecEdges.
	tab list displayBlock: [ :e | e asCompactSourceWidget buildWithSpec ].
	tab list items: aCollection.
	tab search
		search: [ :t | 
			entity graph nodes
				select: [ :n | n class = anEdgeClass sourceClass and: [ n matches: t ] ] ].
	tab search
		resultCreate: [ :n | self createOutgoingEdge: anEdgeClass to: n ].
	tab search searchBar
		create: [ :t | 
			| n |
			n := anEdgeClass sourceClass fromText: t graph: entity graph.
			entity graph add: n.
			self createOutgoingEdge: anEdgeClass to: n ].
	^ self newTab
		model: tab;
		icon: (Smalltalk ui icons iconNamed: #forward);
		label: anEdgeClass label;
		closeable: false;
		yourself