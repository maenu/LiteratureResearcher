initialization
initialize
	edgeDisplayBlock := [ :e | e sourceLabel ].
	edgeIconBlock := [ :e | e source state icon ].
	edgeEndClassBlock := [ :e | e source ].
	edgeOtherEndClassBlock := [ :e | e target ].
	edgesSelector := #incomingEdgesOfClass:.
	super initialize