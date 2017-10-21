phrases-entries
url
	^ super url
		addBlockWithField: #keywords;
		addBlockWithField: #abstract;
		addBlockWithField: #clusterId;
		addBlockWithField: #pdf