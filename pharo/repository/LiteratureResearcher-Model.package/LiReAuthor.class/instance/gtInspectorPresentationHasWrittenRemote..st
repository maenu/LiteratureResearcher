as yet unclassified
gtInspectorPresentationHasWrittenRemote: aComposite
	<gtInspectorPresentationOrder: 3>
	| presentation |
	presentation := aComposite spec.
	presentation
		title: 'Has written (remote)';
		display: [ | model |
			model := LiReSpecEdgesPaginator
				stream: (LiRePaginatedStream block: [ {} ])
				menuModelBlock: [ :e | 
					| menu |
					menu := MenuModel new.
					menu
						addGroup: [ :group | 
							group
								addItem: [ :mi | 
									mi
										name: 'Select in graph';
										action: [ announcer announce: (LiReRequestSelectEdge entity: e) ] ] ].
					menu ]
				displayBlock: [ :e | e targetLabel ]
				iconBlock: [ :e | e target state icon ].
			model listModel whenSelectedItemChanged: [ :e | e ifNotNil: [ presentation selection: e ] ].
			announcer
				announce:
					(LiReRequestScholarPy
						block: [ :s | 
							model
								stream:
									(LiRePaginatedStream
										block: [ :ss :c | 
											(s findByAuthors: {name} start: ss count: c)
												collect: [ :d | 
													| node edge |
													node := graph nodes
														detect: [ :n | n matches: (d at: #title) ]
														ifFound: [ :n | n mergeCsv: d ]
														ifNone: [ | n b |
															b := CZEntry type: CZEntry article.
															b key: 'GENERATED'.
															d keysAndValuesDo: [ :k :v | b at: k put: v ].
															n := self class
																graph: graph
																bibtex: b
																csv: d
																document: nil.
															graph nodes add: n.
															n ].
													edge := (self incomingEdgesOfClass: LiReReferences)
														detect: [ :e | e target == node ]
														ifNone: [ | e |
															e := LiReHasWritten
																graph: graph
																source: self
																target: node
																key: ''
																order: -1
																bibtex: nil
																text: ''.
															graph edges add: e.
															e ].
													edge ] ]) ]).
			model
				buildWithSpec;
				yourself ]