initialization
newMenu: anItem
	| menu |
	menu := MenuModel new.
	(self findInGraph: anItem)
		ifNil: [ menu
				addGroup: [ :group | 
					group
						addItem: [ :mi | 
							mi
								name: 'Load';
								action: [ loadBlock cull: anItem ] ] ] ]
		ifNotNil: [ :n | 
			menu
				addGroup: [ :group | 
					group
						addItem: [ :mi | 
							mi
								name: 'Select in graph';
								action: [ selectBlock cull: n ] ] ] ].
	^ menu