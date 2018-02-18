initialization
initialize
	super initialize.
	bibtex := NewValueHolder new.
	self observeProperty: #bibtex.
	titleLink := NewValueHolder new.
	self observeProperty: #titleLink.
	self whenPropertyChangedDo: [ self invalidate ].
	labels whenAddedDo: [ self invalidate ].
	labels whenRemovedDo: [ self invalidate ]