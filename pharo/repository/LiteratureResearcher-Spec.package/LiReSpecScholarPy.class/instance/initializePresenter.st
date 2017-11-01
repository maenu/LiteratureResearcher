initialization
initializePresenter
	searchButton
		action: [ searchButton
				label: 'Searching...';
				disable.
			list disable.
			[ [ list items: (searchBlock cull: searchText pendingText) ]
				ensure: [ searchButton
						label: 'Search';
						enable.
					list enable ] ] fork ].
	list
		displayBlock: [ :i | i at: #title ];
		icons:
				[ :i | (self findInGraph: i) ifNil: [ Smalltalk ui icons iconNamed: #testNotRun ] ifNotNil: [ Smalltalk ui icons iconNamed: #testGreen ] ];
		whenSelectedItemChanged: [ :i | i ifNotNil: [ item item: i ] ];
		menu: [ :m | 
			list selectedItem
				ifNil: [ m ]
				ifNotNil: [ :i | 
					m
						addAllMorphs: ((self newMenu: i) buildWithSpec: #popup) items;
						yourself ] ]