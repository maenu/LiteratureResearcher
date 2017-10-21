initialization
initializePresenter
	searchButton action: [ resultList items: (searchBlock value: searchText text) ].
	createButton action: [ createFromSearchTextBlock value: searchText text ].
	resultList displayBlock: [ :e | resultListDisplayBock cull: e ].
	resultList
		menu: [ :m | 
			resultList selectedItem
				ifNil: [ m ]
				ifNotNil: [ | menu |
					menu := MenuModel new.
					menu
						addGroup: [ :group | 
							group
								addItem: [ :item | 
									item
										name: 'Create';
										action: [ createFromResultBlock value: resultList selectedItem ] ];
								addItem: [ :item | 
									item
										name: 'Read';
										action: [ readFromResultBlock value: resultList selectedItem ] ] ;
								addItem: [ :item | 
									item
										name: 'Update';
										action: [ updateFromResultBlock value: resultList selectedItem ] ] ].
					m
						addAllMorphs: (menu buildWithSpec: #popup) items;
						yourself ] ]