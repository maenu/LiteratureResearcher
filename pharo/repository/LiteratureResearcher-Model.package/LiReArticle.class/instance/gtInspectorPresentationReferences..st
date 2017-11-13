as yet unclassified
gtInspectorPresentationReferences: aComposite
	<gtInspectorPresentationOrder: 2>
	| presentation model |
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
			graph edges add: edge ]
		selectNodeBlock: [ :n | graph announcer announce: (LiReRequestSelectNode entity: n) ]
		selectEdgeBlock: [ :n | graph announcer announce: (LiReRequestSelectEdge entity: n) ].
	presentation := aComposite spec
		title: [ 'References' ];
		display: [ model
				buildWithSpec;
				yourself ];
		yourself.
	model list whenSelectedItemChanged: [ :e | e ifNotNil: [ presentation selection: e ] ]