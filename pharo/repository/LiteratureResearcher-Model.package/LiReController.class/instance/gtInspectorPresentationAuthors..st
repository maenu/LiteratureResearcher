as yet unclassified
gtInspectorPresentationAuthors: aComposite
	<gtInspectorPresentationOrder: 4>
	| presentation |
	presentation := aComposite spec.
	presentation
		title: [ 'Authors' ];
		display: [ | model |
			model := LiReSpecSearch new.
			model searchBlock: [ :s | ReadStream on: ((graph nodesOfClass: LiReAuthor) asOrderedCollection select: [ :n | n matches: s ]) ].
			model paginatorModel
				menuModelBlock: [ :n | 
					| menu |
					menu := MenuModel new.
					menu
						addGroup: [ :group | 
							group
								addItem: [ :mi | 
									mi
										name: 'Select in graph';
										action: [ graph announcer announce: (LiReRequestSelectNode entity: n) ] ] ].
					menu ].
			model paginatorModel listModel
				displayBlock: [ :n | n label ];
				icons: [ :n | n state icon ];
				whenSelectedItemChanged: [ :n | n ifNotNil: [ presentation selection: n ] ].
			model
				buildWithSpec;
				yourself ]