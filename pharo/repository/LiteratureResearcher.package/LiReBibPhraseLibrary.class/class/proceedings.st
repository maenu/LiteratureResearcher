phrases-entries
proceedings
	^ super proceedings
		addBlockWithField: #keywords;
		addBlockWithField: #abstract;
		addBlockWithField: #clusterId;
		addBlockWithField: #pdf;
		addBlockWithField: #url