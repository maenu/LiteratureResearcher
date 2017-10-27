converting
gtInspectorPresentationReferencedByRemote: aComposite
	<gtInspectorPresentationOrder: 5>
	| model |
	model := LiReSpecScholarPy new
		graph: graph;
		searchBlock: [ | scholarPy |
			self flag: 'should not create scholarpy directly'.
			scholarPy := LiReScholarPy subprocess: (LiReSubprocess command: '../scholar.sh').
			(bibtex hasField: #clusterid)
				ifFalse: [ | clusterId |
					clusterId := scholarPy findClusterId: (bibtex at: #title) value.
					bibtex at: #clusterid put: clusterId ].
			scholarPy findCitations: (bibtex at: #clusterid) value ];
		yourself.
	aComposite spec
		title: [ 'Referenced by (remote)' ];
		display: [ model
				buildWithSpec;
				yourself ]