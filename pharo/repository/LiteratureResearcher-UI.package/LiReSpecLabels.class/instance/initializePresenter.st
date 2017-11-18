initialization
initializePresenter
	paginatorModel
		menuModelBlock: [ :l | 
			| menu |
			menu := MenuModel new.
			menu
				addGroup: [ :group | 
					group
						addItem: [ :mi | 
							mi
								name: 'Remove';
								action: [ labels remove: l ] ] ].
			menu ].
	paginatorModel listModel
		displayBlock: [ :l | l asString ];
		icons: [ :l | l asIcon ].
	addButtonModel action: [ labels add: addDropListModel selectedItem ].
	createTextModel
		whenTextChanged: [ :t | 
			| exists |
			exists := LiReLabel instanceWithNameExists: t asString.
			createTextModel hasEditingConflicts: exists.
			createButtonModel enabled: (exists not and: t asString trimmed isEmpty not) ].
	createButtonModel
		disable;
		action: [ labels add: (LiReLabel name: createTextModel text asString color: createColorModel selectedColor) ]