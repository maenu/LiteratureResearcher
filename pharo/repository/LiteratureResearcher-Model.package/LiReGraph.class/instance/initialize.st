initialization
initialize
	super initialize.
	announcer := Announcer new.
	nodes := CollectionValueHolder value: Set new.
	edges := CollectionValueHolder value: Set new.
	nodes whenAddedDo: [ :n | announcer announce: (LiReNodeAdded node: n) ].
	nodes whenRemovedDo: [ :n | announcer announce: (LiReNodeRemoved node: n) ].
	edges whenAddedDo: [ :e | announcer announce: (LiReEdgeAdded edge: e) ].
	edges whenRemovedDo: [ :e | announcer announce: (LiReEdgeRemoved edge: e) ]