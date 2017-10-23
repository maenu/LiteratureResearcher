initialization
initializePresenter
	searchButton
		action: [ searchButton
				label: 'Searching...';
				disable.
			[ [ list items: searchBlock value ]
				ensure: [ searchButton label: 'Search' ] ] fork ].
	list
		displayBlock: [ :i | i at: #title ];
		icons: [ :i | 
			(self isInGraph: i)
				ifTrue: [ Smalltalk ui icons iconNamed: #testGreen ]
				ifFalse: [ Smalltalk ui icons iconNamed: #testNotRun ] ];
		whenSelectedItemChanged: [ :i | 
			item := i ifNil: [ itemPlaceholder ] ifNotNil: [ LiReSpecScholarPyItem item: i ].
			self needRebuild: false.
			self buildWithSpec ];
		menu: [ :m | 
			list selectedItem
				ifNil: [ m ]
				ifNotNil: [ :i | 
					m
						addAllMorphs: ((self newMenu: i) buildWithSpec: #popup) items;
						yourself ] ]