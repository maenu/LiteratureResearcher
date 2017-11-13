initialization
initializePresenter
	listModel
		menu: [ :m | 
			listModel selectedItem
				ifNil: [ m ]
				ifNotNil: [ :e | 
					(menuModelBlock cull: e)
						ifNotNil: [ :mm | 
							m
								addAllMorphs: (mm buildWithSpec: #popup) items;
								yourself ] ] ].
	backModel
		action: [ start := 0 max: start - size.
			self invalidate ].
	forwardModel
		action: [ start := start + size.
			self invalidate ]