phrases-entries
url
	^ super url
		addBlockWithField: #keywords;
		addBlockWithField: #abstract;
		addBlockWithField: #clusterid;
		addBlockWithField: #citations;
		addBlockWithField: #pdf