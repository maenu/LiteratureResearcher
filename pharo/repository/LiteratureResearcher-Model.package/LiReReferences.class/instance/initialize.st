initialization
initialize
	super initialize.
	bibtex := NewValueHolder new.
	self observeProperty: #bibtex