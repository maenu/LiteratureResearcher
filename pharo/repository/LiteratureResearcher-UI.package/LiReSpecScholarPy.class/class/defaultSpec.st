specs
defaultSpec
	^ SpecColumnLayout composed
		newRow: [ :row | 
			row
				add: #textModel;
				add: #buttonModel ]
			height: self toolbarHeight;
		newRow: [ :row | row add: #paginatorModel ];
		yourself