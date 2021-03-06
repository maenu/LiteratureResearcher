inspector extensions
gtInspectorPresentationReferencedBy: aComposite
	<gtInspectorPresentationOrder: 5>
	| presentation |
	presentation := aComposite spec.
	presentation
		title: 'Referenced by';
		display: [ | model |
			model := LiReSpecIncomingEdges new.
			model
				edgeClass: LiReReferences;
				edgeCreateBlock: [ :n | 
					| order existingEdges edge |
					existingEdges := (self incomingEdgesOfClass: LiReReferences) asOrderedCollection collect: #order.
					order := existingEdges ifEmpty: [ 1 ] ifNotEmpty: [ existingEdges max ].
					edge := LiReReferences
						graph: self graph
						source: n
						target: self
						key: 'GENERATED'
						order: order.
					self graph edges add: edge ];
				node: self.
			model paginatorModel listModel whenSelectedItemChanged: [ :e | e ifNotNil: [ presentation selection: e ] ].
			model searchModel paginatorModel listModel whenSelectedItemChanged: [ :e | e ifNotNil: [ presentation selection: e ] ].
			model
				buildWithSpec;
				yourself ]