as yet unclassified
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
			model listModel
				displayBlock: [ :e | e targetLabel ];
				icons: [ :e | e target asIcon ];
				whenSelectedItemChanged: [ :e | e ifNotNil: [ presentation selection: e ] ].
			graph announcer
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
															n := LiReArticle
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
																email: ''
																institution: ''
																country: ''.
															graph edges add: e.
															e ].
													edge ] ]) ]).
			model
				buildWithSpec;
				yourself ]