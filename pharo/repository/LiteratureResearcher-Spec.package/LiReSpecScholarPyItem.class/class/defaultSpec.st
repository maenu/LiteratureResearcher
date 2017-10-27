specs
defaultSpec
	^ SpecLayout new
		newColumn: [ :c | 
			c
				newRow: [ :r | 
					r
						add: #titleLabel;
						add: #titleModel ]
					height: 2 * self toolbarHeight;
				newRow: [ :r | 
					r
						add: #yearLabel;
						add: #yearModel ]
					height: 2 * self toolbarHeight;
				newRow: [ :r | 
					r
						add: #citationsLabel;
						add: #citationsModel ]
					height: 2 * self toolbarHeight;
				newRow: [ :r | r add: #excerptLabel ] height: 2 * self toolbarHeight;
				newRow: [ :r | r add: #excerptModel ] ];
		yourself