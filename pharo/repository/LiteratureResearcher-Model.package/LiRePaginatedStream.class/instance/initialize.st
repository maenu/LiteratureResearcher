initialization
initialize
	super initialize.
	cache := OrderedCollection new.
	position := 0.
	pageSize := 20.
	complete := false