instance creation
newTabIncomingEdges: anEdgeClass with: aCollection
	| tab |
	tab := self instantiate: LiReSpecEdges.
	tab list displayBlock: [ :e | e asCompactTargetWidget buildWithSpec ].
	tab list items: aCollection.
	tab search
		search: [ :t | 
			entity graph nodes
				select: [ :n | n class = anEdgeClass targetClass and: [ n matches: t ] ] ].
	tab search
		resultCreate: [ :n | self createIncomingEdge: anEdgeClass from: n ].
	tab search searchBar
		create: [ :t | 
			| n |
			n := anEdgeClass targetClass fromText: t graph: entity graph.
			entity graph add: n.
			self createIncomingEdge: anEdgeClass from: n ].
	^ self newTab
		model: tab;
		icon: (Smalltalk ui icons iconNamed: #back);
		label: anEdgeClass label;
		closeable: false;
		yourself