as yet unclassified
gtInspectorPresentationWrittenBy: aComposite
	<gtInspectorPresentationOrder: 4>
	| model |
	model := LiReSpecEdges
		node: self
		edgeClass: LiReHasWritten
		edgesSelector: #incomingEdgesOfClass:
		edgeDisplayBlock: [ :e | e targetLabel ]
		edgeEndClassSelector: #targetClass
		edgeOtherEndClassSelector: #sourceClass
		createEdgeBlock: [ :n | 
			| edge |
			edge := LiReHasWritten
				graph: graph
				source: n
				target: self
				key: 'GENERATED'.
			graph edges add: edge ].
	aComposite spec
		title: [ 'Written by' ];
		display: [ model
				buildWithSpec;
				yourself ]