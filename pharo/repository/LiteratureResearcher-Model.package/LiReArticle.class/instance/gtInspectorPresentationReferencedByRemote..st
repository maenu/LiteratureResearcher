converting
gtInspectorPresentationReferencedByRemote: aComposite
	<gtInspectorPresentationOrder: 5>
	| model |
	model := (LiReSpecScholarPy node: self)
		selectBlock: [ :n | n announcer announce: LiReRequestSelect new ];
		loadBlock: [ :d | announcer announce: (LiReRequestLoadReferencedByFromCsv csv: d) ];
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
							value := s findCitations: (bibtex at: #clusterid) value ]
								ensure: [ lock signal ] ]).
			lock wait.
			value ];
		yourself.
	aComposite spec
		title: [ 'Referenced by (remote)' ];
		display: [ model
				buildWithSpec;
				yourself ]