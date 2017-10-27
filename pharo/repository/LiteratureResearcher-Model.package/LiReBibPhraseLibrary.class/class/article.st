phrases-entries
article
	^ super article
		addBlockWithField: #keywords;
		addBlockWithField: #abstract;
		addBlockWithField: #clusterid;
		addBlockWithField: #pdf;
		addBlockWithField: #url