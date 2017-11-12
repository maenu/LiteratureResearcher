initialization
initializePresenter
	super initializePresenter.
	listModel
		displayBlock: [ :i | i asString ];
		icons: [ :i | i graph ifNil: [ Smalltalk ui icons iconNamed: #testNotRun ] ifNotNil: [ Smalltalk ui icons iconNamed: #testGreen ] ];
		menu: [ :m | 
			listModel selectedItem
				ifNil: [ m ]
				ifNotNil: [ :i | 
					(menuModelBlock cull: i)
						ifNotNil: [ :mm | 
							m
								addAllMorphs: (mm buildWithSpec: #popup) items;
								yourself ] ] ]