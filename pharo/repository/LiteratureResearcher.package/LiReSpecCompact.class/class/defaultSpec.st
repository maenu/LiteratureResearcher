specs
defaultSpec
	^ SpecLayout composed
		newRow: [ :row | 
			row
				newColumn: #buttonRead width: self toolbarHeight;
				newColumn: #buttonUpdate width: self toolbarHeight;
				newColumn: #buttonDelete width: self toolbarHeight;
				newColumn: #label ];
		yourself