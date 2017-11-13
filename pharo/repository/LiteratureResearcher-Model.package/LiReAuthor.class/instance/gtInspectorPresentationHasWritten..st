as yet unclassified
gtInspectorPresentationHasWritten: aComposite
	<gtInspectorPresentationOrder: 2>
	| presentation model |
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
				order: order.
			graph edges add: edge ]
		selectNodeBlock: [ :n | graph announcer announce: (LiReRequestSelectNode entity: n) ]
		selectEdgeBlock: [ :n | graph announcer announce: (LiReRequestSelectEdge entity: n) ].
	presentation := aComposite spec
		title: [ 'Has written' ];
		display: [ model
				buildWithSpec;
				yourself ];
		yourself.
	model list whenSelectedItemChanged: [ :e | e ifNotNil: [ presentation selection: e ] ]