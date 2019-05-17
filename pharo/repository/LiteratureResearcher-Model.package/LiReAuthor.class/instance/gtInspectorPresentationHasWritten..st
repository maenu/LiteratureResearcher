inspector extensions
gtInspectorPresentationHasWritten: aComposite
	<gtInspectorPresentationOrder: 3>
	| presentation |
	presentation := aComposite spec.
	presentation
		title: 'Has written';
		display: [ | model |
			model := LiReSpecOutgoingEdges new.
			model
				edgeClass: LiReHasWritten;
				edgeCreateBlock: [ :n | 
					| order existingEdges edge |
					existingEdges := (self outgoingEdgesOfClass: LiReHasWritten) asOrderedCollection collect: #order.
					order := existingEdges ifEmpty: [ 1 ] ifNotEmpty: [ existingEdges max ].
					edge := LiReHasWritten
						graph: self graph
						source: self
						target: n
						key: 'GENERATED'
						order: order.
					self graph edges add: edge ];
				node: self.
			model paginatorModel listModel whenSelectedItemChanged: [ :e | e ifNotNil: [ presentation selection: e ] ].
			model searchModel paginatorModel listModel whenSelectedItemChanged: [ :e | e ifNotNil: [ presentation selection: e ] ].
			model
				buildWithSpec;
				yourself ]