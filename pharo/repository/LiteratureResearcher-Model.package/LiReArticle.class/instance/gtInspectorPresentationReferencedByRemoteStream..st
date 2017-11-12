converting
gtInspectorPresentationReferencedByRemoteStream: aComposite
	<gtInspectorPresentationOrder: 6>
	| model presentation |
	model := LiReSpecPaginator
		stream: LiRePaginatedStream new
		menuModelBlock: [ :a | 
			| menu |
			menu := MenuModel new.
			menu
				addGroup: [ :group | 
					group
						addItem: [ :mi | 
							self flag: 'should select edge + node'.
							mi
								name: 'Select in graph';
								action: [ announcer announce: (LiReRequestSelectNode entity: a) ] ] ].
			menu ].
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
											| node |
											self flag: 'must ensure that all edges and nodes are in the graph'.
											node := graph nodes detect: [ :n | n matches: (d at: #title) ] ifNone: [ self class new ].
											node csv: d.
											node ] ] ]
								ensure: [ lock signal ] ]).
			lock wait.
			model
				buildWithSpec;
				yourself ].
	model list whenSelectedItemChanged: [ :a | presentation selection: a ]