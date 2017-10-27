as yet unclassified
gtInspectorPresentationReferences: aComposite
	<gtInspectorPresentationOrder: 2>
	| model |
	model := LiReSpecEdges
		node: self
		edgeClass: LiReReferences
		edgesSelector: #outgoingEdgesOfClass:
		edgeDisplayBlock: [ :e | e targetLabel ]
		edgeEndClassSelector: #sourceClass
		edgeOtherEndClassSelector: #targetClass
		createEdgeBlock: [ :n | 
			| edge |
			edge := LiReReferences
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