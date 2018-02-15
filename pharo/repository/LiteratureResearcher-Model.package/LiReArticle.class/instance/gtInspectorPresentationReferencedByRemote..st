inspector extensions
gtInspectorPresentationReferencedByRemote: aComposite
	<gtInspectorPresentationOrder: 6>
	| presentation |
	presentation := aComposite spec.
	presentation
		title: 'Referenced by (remote)';
		display: [ | model |
			model := LiReSpecPaginator new
				stream:
					(LiRePaginatedStream
						block: [ :s :c | 
							| lock elements |
							elements := {}.
							lock := Semaphore new.
							graph announcer
								announce:
									((LiReRequestSearchManyCitations object: self start: s count: c)
										then: [ :e | 
											elements := e.
											lock signal ];
										yourself).
							self flag: 'TODO timeout'.
							lock wait elements ]);
				menuModelBlock: [ :e | 
					| menu |
					menu := MenuModel new.
					menu
						addGroup: [ :group | 
							group
								addItem: [ :mi | 
									mi
										name: 'Select in graph';
										action: [ self graph announcer announce: (LiReRequestSelectEdge entity: e) ] ] ].
					menu ];
				yourself.
			model listModel
				displayBlock: [ :e | e asSourceString ];
				icons: [ :e | e source asIcon ];
				whenSelectedItemChanged: [ :e | e ifNotNil: [ presentation selection: e ] ].
			model
				buildWithSpec;
				yourself ]