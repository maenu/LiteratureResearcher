phrases-entries
article
	^ super article
		addBlockWithField: #keywords;
		addBlockWithField: #abstract;
		addBlockWithField: #clusterid;
		addBlockWithField: #citations;
		addBlockWithField: #pdf;
		addBlockWithField: #url