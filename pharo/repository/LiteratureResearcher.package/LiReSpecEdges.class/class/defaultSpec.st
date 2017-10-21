specs
defaultSpec
	^ SpecLayout composed
		newRow: [ :row | 
			row
				add: #list;
				add: #search ];
		yourself