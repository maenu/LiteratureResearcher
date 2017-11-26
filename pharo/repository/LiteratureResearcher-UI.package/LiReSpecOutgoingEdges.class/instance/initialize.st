initialization
initialize
	edgeDisplayBlock := [ :e | e asTargetString ].
	edgeIconBlock := [ :e | e target asIcon ].
	edgeEndClassBlock := [ :c | c targetClass ].
	edgeOtherEndClassBlock := [ :c | c sourceClass ].
	edgesSelector := #outgoingEdgesOfClass:.
	super initialize