inspector extensions
gtInspectorPresentationArticles: aComposite
	<gtInspectorPresentationOrder: 3>
	| presentation |
	presentation := aComposite spec.
	presentation
		title: [ 'Articles' ];
		display: [ | model |
			model := LiReSpecSearch new.
			model searchBlock: [ :s | ReadStream on: ((graph nodesOfClass: LiReArticle) asOrderedCollection select: [ :n | n matches: s ]) ].
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
				displayBlock: [ :n | n asString ];
				icons: [ :n | n asIcon ];
				whenSelectedItemChanged: [ :n | n ifNotNil: [ presentation selection: n ] ].
			model
				buildWithSpec;
				yourself ]