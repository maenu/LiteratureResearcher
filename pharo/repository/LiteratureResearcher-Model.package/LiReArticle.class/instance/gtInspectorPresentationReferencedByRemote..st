converting
gtInspectorPresentationReferencedByRemote: aComposite
	<gtInspectorPresentationOrder: 5>
	| presentation |
	presentation := aComposite spec.
	presentation
		title: 'Referenced by (remote)';
		display: [ | model |
			model := LiReSpecPaginator new
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
					menu ];
				yourself.
			model listModel
				displayBlock: [ :e | e sourceLabel ];
				icons: [ :e | e source state icon ];
				whenSelectedItemChanged: [ :e | e ifNotNil: [ presentation selection: e ] ].
			announcer
				announce:
					(LiReRequestScholarPy
						block: [ :s | 
							(bibtex hasField: #clusterid)
								ifFalse: [ | clusterId |
									clusterId := s findClusterId: (bibtex at: #title) value.
									bibtex at: #clusterid put: clusterId.
									self propertyChanged: #bibtex ].
							model
								stream:
									(LiRePaginatedStream
										block: [ :ss :c | 
											(s findCitations: (bibtex at: #clusterid) value start: ss count: c)
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
														detect: [ :e | e source == node ]
														ifNone: [ | e |
															e := LiReReferences
																graph: graph
																source: node
																target: self
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