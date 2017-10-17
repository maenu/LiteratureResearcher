specs
defaultSpec
	^ SpecColumnLayout composed
		newRow: #edge;
		newRow: [ :row | 
			row
				newColumn: #pointer width: self toolbarHeight;
				newColumn: #node ];
		yourself