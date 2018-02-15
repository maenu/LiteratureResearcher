initialization
initialize
	super initialize.
	announcer := Announcer new.
	graph := NewValueHolder new.
	self observeProperty: #graph