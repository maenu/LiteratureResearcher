specs
defaultSpec
	^ SpecColumnLayout composed
		newRow: [ :row | 
			row
				add: #searchText;
				add: #searchButton ]
			height: self toolbarHeight;
		newRow: [ :row | 
			row
				add: #list;
				add: #item ];
		yourself