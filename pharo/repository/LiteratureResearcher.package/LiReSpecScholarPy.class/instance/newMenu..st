initialization
newMenu: anItem
	| menu |
	menu := MenuModel new.
	(self isInGraph: anItem)
		ifTrue: [ menu
				addGroup: [ :group | 
					group
						addItem: [ :mi | 
							mi
								name: 'Read';
								action: [ self flag: 'TODO open in graph' ] ];
						addItem: [ :mi | 
							mi
								name: 'Update';
								action: [ anItem asWidget openWithSpec ] ] ] ]
		ifFalse: [ menu
				addGroup: [ :group | 
					group
						addItem: [ :mi | 
							mi
								name: 'Load';
								action: [ self flag: 'TODO open in graph' ] ] ] ].
	^ menu