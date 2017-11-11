converting
gtInspectorPresentationReferencedByRemote: aComposite
	<gtInspectorPresentationOrder: 5>
	| model |
	model := (LiReSpecScholarPy node: self)
		selectBlock: [ :n | n announcer announce: (LiReRequestSelectNode entity: n) ];
		loadBlock: [ :d | announcer announce: (LiReRequestLoadReferencedByFromCsv node: self csv: d) ];
		searchBlock: [ | value lock |
			lock := Semaphore new.
			announcer
				announce:
					(LiReRequestScholarPy
						block: [ :s | 
							[ (bibtex hasField: #clusterid)
								ifFalse: [ | clusterId |
									clusterId := s findClusterId: (bibtex at: #title) value.
									bibtex at: #clusterid put: clusterId ].
							self flag: 'pagination'.
							value := s findCitations: (bibtex at: #clusterid) value start: 0 count: 10 ]
								ensure: [ lock signal ] ]).
			lock wait.
			value ];
		yourself.
	model searchText disable.
	aComposite spec
		title: [ 'Referenced by (remote)' ];
		display: [ model
				buildWithSpec;
				yourself ]