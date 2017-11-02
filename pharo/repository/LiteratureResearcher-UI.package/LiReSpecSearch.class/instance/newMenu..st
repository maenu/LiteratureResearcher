instance creation
newMenu: anItem
	| menu |
	menu := MenuModel new.
	menu
		addGroup: [ :group | 
			group
				addItem: [ :mi | 
					mi
						name: 'Create';
						action: [ createFromResultBlock value: anItem ] ];
				addItem: [ :mi | 
					mi
						name: 'Select in graph';
						action: [ resultListSelectBlock cull: anItem ] ] ].
	^ menu