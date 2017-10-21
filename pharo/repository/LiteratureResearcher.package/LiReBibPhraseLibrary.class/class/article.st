phrases-entries
article
	^ super article
		addBlockWithField: #keywords;
		addBlockWithField: #abstract;
		addBlockWithField: #clusterId;
		addBlockWithField: #pdf;
		addBlockWithField: #url