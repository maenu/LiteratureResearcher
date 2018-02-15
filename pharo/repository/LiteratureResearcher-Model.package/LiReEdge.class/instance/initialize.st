initialization
initialize
	super initialize.
	source := NewValueHolder new.
	self observeProperty: #source.
	target := NewValueHolder new.
	self observeProperty: #target.
	key := NewValueHolder new.
	self observeProperty: #key.
	order := NewValueHolder new.
	self observeProperty: #order.
	link := NewValueHolder new.
	self observeProperty: #link