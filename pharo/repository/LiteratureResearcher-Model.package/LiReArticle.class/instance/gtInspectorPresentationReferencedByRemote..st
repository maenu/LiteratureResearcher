inspector extensions
gtInspectorPresentationReferencedByRemote: aComposite
	<gtInspectorPresentationOrder: 6>
	| presentation |
	presentation := aComposite spec.
	presentation
		title: 'Referenced by (remote)';
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
										action: [ self graph announcer announce: (LiReRequestSelectEdge entity: e) ] ] ].
					menu ];
				yourself.
			self flag: 'TODO make somebody care about this fork'.
			[ model
				stream:
					(LiRePaginatedStream
						block: [ :s :c | 
							| nodes |
							nodes := self graph announcer announce: (LiReRequestSearchManyCitations object: self start: s count: c) wait: 1 minute.
							nodes flatCollect: [ :n | (n outgoingEdgesOfClass: LiReReferences) select: [ :e | e target = self ] ] ]) ] fork.
			model listModel
				displayBlock: [ :e | e asSourceString ];
				icons: [ :e | e source asIcon ];
				whenSelectedItemChanged: [ :e | e ifNotNil: [ presentation selection: e ] ].
			model
				buildWithSpec;
				yourself ]