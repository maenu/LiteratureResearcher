initialization
initializePresenter
	searchButton
		action: [ searchButton
				label: 'Searching...';
				disable.
			list disable.
			[ [ list items: searchBlock value ]
				ensure: [ searchButton
						label: 'Search';
						enable.
					list enable ] ] fork ].
	list
		displayBlock: [ :i | i at: #title ];
		icons: [ :i | 
			(self isInGraph: i)
				ifTrue: [ Smalltalk ui icons iconNamed: #testGreen ]
				ifFalse: [ Smalltalk ui icons iconNamed: #testNotRun ] ];
		whenSelectedItemChanged: [ :i | i ifNotNil: [ item item: i ] ];
		menu: [ :m | 
			list selectedItem
				ifNil: [ m ]
				ifNotNil: [ :i | 
					m
						addAllMorphs: ((self newMenu: i) buildWithSpec: #popup) items;
						yourself ] ]