phrases-entries
book
	^ super book
		addBlockWithField: #keywords;
		addBlockWithField: #abstract;
		addBlockWithField: #clusterid;
		addBlockWithField: #pdf;
		addBlockWithField: #url