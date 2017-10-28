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
			| order existingEdges edge |
			existingEdges := (self outgoingEdgesOfClass: LiReHasWritten) collect: #order.
			order := existingEdges ifEmpty: [ 1 ] ifNotEmpty: [ existingEdges max ].
			edge := LiReHasWritten
				graph: graph
				source: self
				target: n
				key: 'GENERATED'
				order: 1.
			graph edges add: edge ].
	aComposite spec
		title: [ 'References' ];
		display: [ model
				buildWithSpec;
				yourself ]