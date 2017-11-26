inspector extensions
gtInspectorPresentationWrittenBy: aComposite
	<gtInspectorPresentationOrder: 4>
	| presentation |
	presentation := aComposite spec.
	presentation
		title: 'Written by';
		display: [ | model |
			model := LiReSpecIncomingEdges new.
			model
				edgeClass: LiReHasWritten;
				edgeCreateBlock: [ :n | 
					| order existingEdges edge |
					existingEdges := (self incomingEdgesOfClass: LiReHasWritten) asOrderedCollection collect: #order.
					order := existingEdges ifEmpty: [ 1 ] ifNotEmpty: [ existingEdges max ].
					edge := LiReHasWritten
						graph: graph
						source: n
						target: self
						key: 'GENERATED'
						order: order.
					graph edges add: edge ];
				node: self.
			model paginatorModel listModel whenSelectedItemChanged: [ :e | e ifNotNil: [ presentation selection: e ] ].
			model searchModel paginatorModel listModel whenSelectedItemChanged: [ :e | e ifNotNil: [ presentation selection: e ] ].
			model
				buildWithSpec;
				yourself ]