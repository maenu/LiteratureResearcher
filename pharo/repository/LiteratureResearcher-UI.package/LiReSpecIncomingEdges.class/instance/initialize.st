initialization
initialize
	edgeDisplayBlock := [ :e | e asSourceString ].
	edgeIconBlock := [ :e | e source asIcon ].
	edgeEndClassBlock := [ :c | c sourceClass ].
	edgeOtherEndClassBlock := [ :c | c targetClass ].
	edgesSelector := #incomingEdgesOfClass:.
	super initialize