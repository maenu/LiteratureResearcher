phrases-entries
inbook
	^ super inbook
		addBlockWithField: #keywords;
		addBlockWithField: #abstract;
		addBlockWithField: #clusterid;
		addBlockWithField: #pdf;
		addBlockWithField: #url