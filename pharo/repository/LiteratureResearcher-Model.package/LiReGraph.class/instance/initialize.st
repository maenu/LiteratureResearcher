initialization
initialize
	super initialize.
	announcer := Announcer new.
	nodes := CollectionValueHolder value: Set new.
	edges := CollectionValueHolder value: Set new.
	nodes whenAddedDo: [ :n | announcer announce: (LiReNodeAdded graph: self node: n) ].
	nodes whenRemovedDo: [ :n | announcer announce: (LiReNodeRemoved graph: self node: n) ].
	edges whenAddedDo: [ :e | announcer announce: (LiReEdgeAdded graph: self edge: e) ].
	edges whenRemovedDo: [ :e | announcer announce: (LiReEdgeRemoved graph: self edge: e) ]