initialization
initialize
	super initialize.
	email := NewValueHolder new.
	self observeProperty: #email.
	institution := NewValueHolder new.
	self observeProperty: #institution.
	country := NewValueHolder new.
	self observeProperty: #country