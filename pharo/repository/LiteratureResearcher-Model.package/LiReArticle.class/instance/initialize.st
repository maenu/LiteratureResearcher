initialization
initialize
	super initialize.
	announcer when: LiRePropertyChanged do: [ :a | self invalidate ].
	labels whenAddedDo: [ :l | self invalidate ].
	labels whenRemovedDo: [ :l | self invalidate ]