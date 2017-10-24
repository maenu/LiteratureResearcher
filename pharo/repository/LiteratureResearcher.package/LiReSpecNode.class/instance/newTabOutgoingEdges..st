instance creation
newTabOutgoingEdges: anEdgeClass
	^ self newTab
		model:
			(LiReSpecEdges
				node: entity
				edgeClass: anEdgeClass
				edgesSelector: #outgoingEdgesOfClass:
				edgeDisplayBlock: [ :e | e targetLabel ]
				edgeEndClassSelector: #sourceClass
				edgeOtherEndClassSelector: #targetClass
				createEdgeBlock: [ :n | self createOutgoingEdge: anEdgeClass to: n ]);
		icon: (Smalltalk ui icons iconNamed: #forward);
		label: anEdgeClass label;
		closeable: false;
		yourself