initialization
initializePresenter
	searchButton action: [ resultList items: (searchBlock value: searchText text) ].
	createButton action: [ createFromSearchTextBlock value: searchText pendingText asString ].
	resultList displayBlock: [ :e | resultListDisplayBlock cull: e ].
	resultList
		menu: [ :m | 
			resultList selectedItem
				ifNil: [ m ]
				ifNotNil: [ :i | 
					m
						addAllMorphs: ((self newMenu: i) buildWithSpec: #popup) items;
						yourself ] ]