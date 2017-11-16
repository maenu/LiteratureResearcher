initialization
initialize
	edgeDisplayBlock := [ :e | e targetLabel ].
	edgeIconBlock := [ :e | e target state icon ].
	edgeEndClassBlock := [ :e | e target ].
	edgeOtherEndClassBlock := [ :e | e source ].
	edgesSelector := #outgoingEdgesOfClass:.
	super initialize