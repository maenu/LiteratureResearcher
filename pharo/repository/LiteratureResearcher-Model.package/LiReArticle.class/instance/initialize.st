initialization
initialize
	super initialize.
	labels whenAddedDo: [ :l | self invalidateTitleLink ].
	labels whenRemovedDo: [ :l | self invalidateTitleLink ]