specs
defaultSpec
	^ SpecLayout composed
		newColumn: [ :c | 
			c
				newRow: [ :r | r add: #paginatorModel ];
				newRow: [ :r | 
					r
						add: #addDropListModel;
						add: #addButtonModel width: self toolbarHeight ]
					height: self toolbarHeight;
				newRow: [ :r | 
					self flag: 'color model width should be adaptable'.
					r
						add: #createColorModel width: 60;
						add: #createTextModel;
						add: #createButtonModel width: self toolbarHeight ]
					height: self toolbarHeight;
				yourself ]