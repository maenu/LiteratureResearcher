specs
defaultSpec
	^ SpecLayout composed
		newRow: [ :row | 
			row
				newColumn: #text;
				newColumn: #button width: self toolbarHeight ];
		yourself