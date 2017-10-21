instance creation
newTabIncomingEdges: anEdgeClass
	^ self newTab
		model:
			(LiReSpecEdges
				node: entity
				edgeClass: anEdgeClass
				edgesSelector: #incomingEdgesOfClass:
				edgeDisplayBlock: [ :e | e sourceLabel ]
				edgeEndClassSelector: #targetClass
				createEdgeBlock: [ :n | self createIncomingEdge: anEdgeClass from: n ]);
		icon: (Smalltalk ui icons iconNamed: #back);
		label: anEdgeClass label;
		closeable: false;
		yourself