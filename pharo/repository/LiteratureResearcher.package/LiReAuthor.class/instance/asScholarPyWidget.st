converting
asScholarPyWidget
	<liReWidget: 2>
	^ LiReSpecScholarPy new
		title: 'By same author';
		graph: graph;
		searchBlock: [ | scholarPy |
			scholarPy := LiReScholarPy subprocess: (LiReSubprocess command: '../scholar.sh').
			scholarPy findByAuthors: {name} ];
		yourself