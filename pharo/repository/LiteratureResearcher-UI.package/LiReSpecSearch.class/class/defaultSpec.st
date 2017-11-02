specs
defaultSpec
	^ SpecLayout composed
		newColumn: [ :c | 
			c
				newRow: [ :r | 
					r
						add: #searchText;
						add: #searchButton width: self toolbarHeight;
						add: #createButton width: self toolbarHeight ]
					height: self toolbarHeight;
				newRow: [ :r | r add: #resultList ] ];
		yourself