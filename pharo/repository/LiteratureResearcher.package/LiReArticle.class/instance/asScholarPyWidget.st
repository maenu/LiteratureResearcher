converting
asScholarPyWidget
	<liReWidget: 2>
	^ LiReSpecScholarPy new
		title: 'Citing papers';
		graph: graph;
		searchBlock: [ | scholarPy |
			scholarPy := LiReScholarPy subprocess: (LiReSubprocess command: '../scholar.sh').
			(bibtex hasField: #clusterid)
				ifFalse: [ | clusterId |
					clusterId := scholarPy findClusterId: (bibtex at: #title) value.
					bibtex at: #clusterid put: clusterId ].
			scholarPy findCitations: (bibtex at: #clusterid) value ];
		yourself