initialization
initialize
	edgeDisplayBlock := [ :e | e sourceLabel ].
	edgeIconBlock := [ :e | e source state icon ].
	edgeEndClassBlock := [ :c | c sourceClass ].
	edgeOtherEndClassBlock := [ :c | c targetClass ].
	edgesSelector := #incomingEdgesOfClass:.
	super initialize