specs
defaultSpec
	^ SpecLayout composed
		newRow: [ :row | 
			row
				newColumn: #text;
				newColumn: #buttonSearch width: self toolbarHeight;
				newColumn: #buttonCreate width: self toolbarHeight ];
		yourself