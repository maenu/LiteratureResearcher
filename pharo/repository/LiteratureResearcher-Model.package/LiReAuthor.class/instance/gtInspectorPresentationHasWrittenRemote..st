as yet unclassified
gtInspectorPresentationHasWrittenRemote: aComposite
	<gtInspectorPresentationOrder: 3>
	| model |
	model := LiReSpecScholarPy new
		graph: graph;
		searchBlock: [ | value lock |
			lock := Semaphore new.
			announcer
				announce:
					(LiReRequestScholarPy
						block: [ :s | 
							[ value := s findByAuthors: {name} ]
								ensure: [ lock signal ] ]).
			lock wait.
			value ];
		yourself.
	aComposite spec
		title: [ 'Has written (remote)' ];
		display: [ model
				buildWithSpec;
				yourself ]