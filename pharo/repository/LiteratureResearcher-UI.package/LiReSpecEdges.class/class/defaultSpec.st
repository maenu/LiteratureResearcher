specs
defaultSpec
	^ SpecLayout composed
		newRow: [ :row | 
			row
				add: #paginatorModel;
				add: #searchModel ];
		yourself