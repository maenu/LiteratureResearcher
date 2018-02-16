inspector extensions
gtInspectorPresentationHasWrittenRemote: aComposite
	<gtInspectorPresentationOrder: 4>
	| presentation |
	presentation := aComposite spec.
	presentation
		title: 'Has written (remote)';
		display: [ | model |
			model := LiReSpecPaginator new
				stream: (LiRePaginatedStream block: [ {} ]);
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
			self flag: 'TODO make somebody care about this fork'.
			[ model
				stream:
					(LiRePaginatedStream
						block: [ :s :c | 
							| nodes |
							nodes := self graph announcer announce: (LiReRequestSearchManyByAuthors object: {self name} start: s count: c) wait: 1 minute.
							nodes flatCollect: [ :n | (n incomingEdgesOfClass: LiReHasWritten) select: [ :e | e source = self ] ] ]) ] fork.
			model listModel
				displayBlock: [ :e | e asTargetString ];
				icons: [ :e | e target asIcon ];
				whenSelectedItemChanged: [ :e | e ifNotNil: [ presentation selection: e ] ].
			model
				buildWithSpec;
				yourself ]