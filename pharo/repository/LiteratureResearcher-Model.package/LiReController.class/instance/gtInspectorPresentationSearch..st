as yet unclassified
gtInspectorPresentationSearch: aComposite
	<gtInspectorPresentationOrder: 2>
	| model |
	model := (LiReSpecScholarPy node: self)
		selectBlock: [ :n | n announcer announce: (LiReRequestSelectNode entity: n) ];
		loadBlock: [ :d | graph announcer announce: (LiReRequestLoadArticleFromCsv node: self csv: d) ];
		searchBlock: [ :t | 
			| value lock |
			t ifEmpty: [ self signal: 'Search text cannot be empty' ].
			lock := Semaphore new.
			graph announcer
				announce:
					(LiReRequestScholarPy
						block: [ :s | 
							[ value := s find: t asString ]
								ensure: [ lock signal ] ]).
			lock wait.
			value ];
		yourself.
	aComposite spec
		title: [ 'Search' ];
		display: [ model
				buildWithSpec;
				yourself ]