phrases-entries
techreport
	^ super techreport
		addBlockWithField: #keywords;
		addBlockWithField: #abstract;
		addBlockWithField: #clusterid;
		addBlockWithField: #citations;
		addBlockWithField: #pdf;
		addBlockWithField: #url