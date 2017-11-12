initialization
initializePresenter
	super initializePresenter.
	listModel
		displayBlock: [ :e | displayBlock cull: e ];
		icons: [ :e | iconBlock cull: e ];
		menu: [ :m | 
			listModel selectedItem
				ifNil: [ m ]
				ifNotNil: [ :e | 
					(menuModelBlock cull: e)
						ifNotNil: [ :mm | 
							m
								addAllMorphs: (mm buildWithSpec: #popup) items;
								yourself ] ] ]