inspector extensions
gtInspectorPresentationHasWrittenRemote: aComposite
	<gtInspectorPresentationOrder: 4>
	| presentation |
	presentation := aComposite spec.
	presentation
		title: 'Has written (remote)';
		display: [ | model |
			model := LiReSpecPaginator new
				stream:
					(LiRePaginatedStream
						block: [ :s :c | 
							| lock elements |
							lock := Semaphore new.
							elements := {}.
							graph announcer
								announce:
									((LiReRequestSearchManyByAuthors object: {self name} asString start: s count: c)
										then: [ :e | 
											elements := e.
											lock signal ];
										yourself).
							self flag: 'TODO timeout'.
							lock wait.
							elements ]);
				menuModelBlock: [ :e | 
					| menu |
					menu := MenuModel new.
					menu
						addGroup: [ :group | 
							group
								addItem: [ :mi | 
									mi
										name: 'Select in graph';
										action: [ graph announcer announce: (LiReRequestSelectEdge entity: e) ] ] ].
					menu ];
				yourself.
			model listModel
				displayBlock: [ :e | e asTargetString ];
				icons: [ :e | e target asIcon ];
				whenSelectedItemChanged: [ :e | e ifNotNil: [ presentation selection: e ] ].
			model
				buildWithSpec;
				yourself ]