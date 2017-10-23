specs
defaultSpec
	^ SpecLayout new
		newColumn: [ :c | 
			c
				newRow: [ :r | 
					r
						add: #titleLabel;
						add: #titleModel ]
					height: self toolbarHeight;
				newRow: [ :r | 
					r
						add: #yearLabel;
						add: #yearModel ]
					height: self toolbarHeight;
				newRow: [ :r | 
					r
						add: #citationsLabel;
						add: #citationsModel ]
					height: self toolbarHeight;
				newRow: [ :r | r add: #excerptLabel ] height: self toolbarHeight;
				newRow: [ :r | r add: #excerptModel ] ];
		yourself