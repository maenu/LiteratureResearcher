phrases-entries
inbook
	^ super inbook
		addBlockWithField: #keywords;
		addBlockWithField: #abstract;
		addBlockWithField: #clusterId;
		addBlockWithField: #pdf;
		addBlockWithField: #url