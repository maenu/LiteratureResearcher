converting
gtInspectorPresentationReferencedByRemoteStream: aComposite
	<gtInspectorPresentationOrder: 6>
	aComposite spec
		title: 'Referenced by (remote)';
		display: [ :a | 
			| stream lock |
			lock := Semaphore new.
			announcer
				announce:
					(LiReRequestScholarPy
						block: [ :s | 
							[ (bibtex hasField: #clusterid)
								ifFalse: [ | clusterId |
									clusterId := s findClusterId: (bibtex at: #title) value.
									bibtex at: #clusterid put: clusterId ].
							stream := LiReScholarPyStream block: [ :ss :c | s findCitations: (bibtex at: #clusterid) value start: ss count: c ].
							Halt now ]
								ensure: [ lock signal ] ]).
			lock wait.
			Halt now.
			(LiReSpecPaginator stream: stream)
				buildWithSpec;
				yourself ]