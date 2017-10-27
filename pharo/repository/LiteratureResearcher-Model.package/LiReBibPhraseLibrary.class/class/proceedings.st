phrases-entries
proceedings
	^ super proceedings
		addBlockWithField: #keywords;
		addBlockWithField: #abstract;
		addBlockWithField: #clusterid;
		addBlockWithField: #pdf;
		addBlockWithField: #url