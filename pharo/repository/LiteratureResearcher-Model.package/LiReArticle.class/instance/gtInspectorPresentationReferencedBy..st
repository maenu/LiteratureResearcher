as yet unclassified
gtInspectorPresentationReferencedBy: aComposite
	<gtInspectorPresentationOrder: 3>
	| presentation model |
	model := LiReSpecEdges
		node: self
		edgeClass: LiReReferences
		edgesSelector: #incomingEdgesOfClass:
		edgeDisplayBlock: [ :e | e targetLabel ]
		edgeEndClassSelector: #targetClass
		edgeOtherEndClassSelector: #sourceClass
		createEdgeBlock: [ :n | 
			| order existingEdges edge |
			existingEdges := (self incomingEdgesOfClass: LiReReferences) collect: #order.
			order := existingEdges ifEmpty: [ 1 ] ifNotEmpty: [ existingEdges max ].
			edge := LiReReferences
				graph: graph
				source: n
				target: self
				key: 'GENERATED'
				order: order.
			graph edges add: edge ]
		selectBlock: [ :n | n announcer announce: LiReRequestSelect new ].
	presentation := aComposite spec
		title: [ 'Referenced by' ];
		display: [ model
				buildWithSpec;
				yourself ];
		yourself.
	model list whenSelectedItemChanged: [ :r | presentation selection: r ]