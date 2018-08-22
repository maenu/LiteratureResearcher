phrases-entries
book
	^ super book
		addBlockWithField: #keywords;
		addBlockWithField: #abstract;
		addBlockWithField: #clusterid;
		addBlockWithField: #citations;
		addBlockWithField: #pdf;
		addBlockWithField: #url