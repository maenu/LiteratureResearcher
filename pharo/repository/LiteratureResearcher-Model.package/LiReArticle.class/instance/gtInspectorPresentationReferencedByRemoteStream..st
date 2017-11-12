converting
gtInspectorPresentationReferencedByRemoteStream: aComposite
	<gtInspectorPresentationOrder: 6>
	| model presentation |
	model := LiReSpecPaginator
		stream: LiRePaginatedStream new
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
		displayBlock: [ :e | e sourceLabel ]
		iconBlock: [ :e | e source state icon ].
	presentation := aComposite spec
		title: 'Referenced by (remote)';
		display: [ | lock |
			lock := Semaphore new.
			announcer
				announce:
					(LiReRequestScholarPy
						block: [ :s | 
							[ (bibtex hasField: #clusterid)
								ifFalse: [ | clusterId |
									clusterId := s findClusterId: (bibtex at: #title) value.
									bibtex at: #clusterid put: clusterId.
									self propertyChanged: #bibtex ].
							model stream
								block: [ :ss :c | 
									(s findCitations: (bibtex at: #clusterid) value start: ss count: c)
										collect: [ :d | 
											| node edge |
											node := graph nodes
												detect: [ :n | n matches: (d at: #title) ]
												ifFound: [ :n | n mergeCsv: d ]
												ifNone: [ | n |
													n := self class
														graph: graph
														bibtex: nil
														csv: d
														document: nil.
													graph nodes add: n.
													n ].
											edge := (self incomingEdgesOfClass: LiReReferences)
												detect: [ :e | e source == node ]
												ifNone: [ | e |
													e := LiReReferences
														graph: graph
														source: self
														target: node
														key: nil
														order: -1
														bibtex: nil
														text: ''.
													graph edges add: e.
													e ].
											edge ] ] ]
								ensure: [ lock signal ] ]).
			lock wait.
			model
				buildWithSpec;
				yourself ].
	model list whenSelectedItemChanged: [ :e | presentation selection: e ]