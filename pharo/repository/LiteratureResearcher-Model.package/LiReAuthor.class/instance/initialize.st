initialization
initialize
	super initialize.
	name := NewValueHolder new.
	self observeProperty: #name