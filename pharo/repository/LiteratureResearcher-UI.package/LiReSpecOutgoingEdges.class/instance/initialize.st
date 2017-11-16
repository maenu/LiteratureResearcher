initialization
initialize
	edgeDisplayBlock := [ :e | e targetLabel ].
	edgeIconBlock := [ :e | e target state icon ].
	edgeEndClassBlock := [ :c | c targetClass ].
	edgeOtherEndClassBlock := [ :c | c sourceClass ].
	edgesSelector := #outgoingEdgesOfClass:.
	super initialize