phrases-entries
manual
	^ super manual
		addBlockWithField: #keywords;
		addBlockWithField: #abstract;
		addBlockWithField: #clusterId;
		addBlockWithField: #pdf;
		addBlockWithField: #url