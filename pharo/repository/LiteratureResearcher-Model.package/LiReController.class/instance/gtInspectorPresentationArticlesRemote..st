inspector extensions
gtInspectorPresentationArticlesRemote: aComposite
	<gtInspectorPresentationOrder: 2>
	| presentation |
	presentation := aComposite spec.
	presentation
		title: [ 'Articles (remote)' ];
		display: [ | model |
			model := LiReSpecSearchRemote new.
			model
				searchBlock: [ :t | 
					LiRePaginatedStream
						block: [ :s :c | graph announcer announce: (LiReRequestSearchManyByAny object: t asString start: s count: c) wait: 1 minute ] ].
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