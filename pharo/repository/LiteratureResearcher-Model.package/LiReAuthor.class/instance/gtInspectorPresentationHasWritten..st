as yet unclassified
gtInspectorPresentationHasWritten: aComposite
	<gtInspectorPresentationOrder: 2>
	| model |
	model := LiReSpecEdges
		node: self
		edgeClass: LiReHasWritten
		edgesSelector: #outgoingEdgesOfClass:
		edgeDisplayBlock: [ :e | e targetLabel ]
		edgeEndClassSelector: #sourceClass
		edgeOtherEndClassSelector: #targetClass
		createEdgeBlock: [ :n | 
			| edge |
			edge := LiReHasWritten
				graph: graph
				source: self
				target: n
				key: 'GENERATED'.
			graph edges add: edge ].
	aComposite spec
		title: [ 'References' ];
		display: [ model
				buildWithSpec;
				yourself ]