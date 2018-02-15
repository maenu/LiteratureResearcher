initialization
initialize
	super initialize.
	bibtex := NewValueHolder new.
	self observeProperty: #bibtex.
	titleLink := NewValueHolder new.
	self observeProperty: #titleLink.
	announcer when: LiRePropertyChanged do: [ :a | self invalidate ].
	labels whenAddedDo: [ :l | self invalidate ].
	labels whenRemovedDo: [ :l | self invalidate ]