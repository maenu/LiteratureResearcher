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
			| order existingEdges edge |
			existingEdges := (self outgoingEdgesOfClass: LiReReferences) collect: #order.
			order := existingEdges ifEmpty: [ 1 ] ifNotEmpty: [ existingEdges max ].
			edge := LiReReferences
				graph: graph
				source: self
				target: n
				key: 'GENERATED'
				order: order.
			graph edges add: edge ].
	aComposite spec
		title: [ 'References' ];
		display: [ model
				buildWithSpec;
				yourself ]