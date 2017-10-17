specs
defaultSpec
	^ SpecLayout composed
		newRow: [ :row | 
			row
				newColumn: #buttonCreate width: self toolbarHeight;
				newColumn: #result ];
		yourself