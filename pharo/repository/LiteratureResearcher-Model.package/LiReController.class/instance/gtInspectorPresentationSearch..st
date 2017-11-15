as yet unclassified
gtInspectorPresentationSearch: aComposite
	<gtInspectorPresentationOrder: 2>
	| presentation |
	presentation := aComposite spec.
	presentation
		title: [ 'Search' ];
		display: [ | model |
			model := LiReSpecSearchRemote new.
			model
				searchBlock: [ :t | 
					LiRePaginatedStream
						block: [ :ss :c | 
							| lock stream |
							lock := Semaphore new.
							stream := LiRePaginatedStream block: [ {} ].
							graph announcer
								announce:
									(LiReRequestScholarPy
										block: [ :s | 
											stream := (s find: t asString start: ss count: c)
												collect: [ :d | 
													| node |
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
															n ] ].
											lock signal ]).
							lock wait.
							stream ] ].
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