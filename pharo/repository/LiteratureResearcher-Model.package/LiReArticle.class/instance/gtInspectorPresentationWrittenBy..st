as yet unclassified
gtInspectorPresentationWrittenBy: aComposite
	<gtInspectorPresentationOrder: 4>
	| presentation model |
	model := LiReSpecEdges
		node: self
		edgeClass: LiReHasWritten
		edgesSelector: #incomingEdgesOfClass:
		edgeDisplayBlock: [ :e | e targetLabel ]
		edgeEndClassSelector: #targetClass
		edgeOtherEndClassSelector: #sourceClass
		createEdgeBlock: [ :n | 
			| order existingEdges edge |
			existingEdges := (self incomingEdgesOfClass: LiReHasWritten) collect: #order.
			order := existingEdges ifEmpty: [ 1 ] ifNotEmpty: [ existingEdges max ].
			edge := LiReHasWritten
				graph: graph
				source: n
				target: self
				key: 'GENERATED'
				order: order.
			graph edges add: edge ]
		selectBlock: [ :n | n announcer announce: LiReRequestSelect new ].
	presentation := aComposite spec
		title: [ 'Written by' ];
		display: [ model
				buildWithSpec;
				yourself ];
		yourself.
	model list whenSelectedItemChanged: [ :r | presentation selection: r ]