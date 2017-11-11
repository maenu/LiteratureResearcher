initialization
initialize
	super initialize.
	cache := OrderedCollection new.
	position := 0.
	atEnd := false.
	pageSize := 10