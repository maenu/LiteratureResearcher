phrases-entries
techreport
	^ super techreport
		addBlockWithField: #keywords;
		addBlockWithField: #abstract;
		addBlockWithField: #clusterId;
		addBlockWithField: #pdf;
		addBlockWithField: #url