specs
defaultSpec
	^ SpecLayout composed
		newColumn: [ :c | 
			c
				newRow: [ :r | 
					r
						add: #searchTextModel;
						add: #searchButtonModel width: self toolbarHeight;
						add: #createButtonModel width: self toolbarHeight ]
					height: self toolbarHeight;
				newRow: [ :r | r add: #paginatorModel ] ];
		yourself