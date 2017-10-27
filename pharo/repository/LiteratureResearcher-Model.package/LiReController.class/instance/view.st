accessing
view
	^ view ifNil: [ view := graph asRoassalView ]