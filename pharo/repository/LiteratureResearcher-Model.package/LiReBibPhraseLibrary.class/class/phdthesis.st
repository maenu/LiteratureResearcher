phrases-entries
phdthesis
	^ super phdthesis
		addBlockWithField: #keywords;
		addBlockWithField: #abstract;
		addBlockWithField: #clusterid;
		addBlockWithField: #citations;
		addBlockWithField: #pdf;
		addBlockWithField: #url