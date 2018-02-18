initialization
initialize
	super initialize.
	announcer := Announcer new.
	nodes := CollectionValueHolder value: Set new.
	edges := CollectionValueHolder value: Set new.
	nodes
		whenAddedDo: [ :c_ | 
			| c |
			c := c_ isCollection
				ifTrue: [ c_ ]
				ifFalse: [ {c_} ].
			c
				do: [ :n | 
					n
						whenPropertyChangedDo: [ :a | 
							a property = #hidden
								ifTrue: [ a newValue
										ifTrue: [ announcer announce: (LiReNodeHidden node: n) ]
										ifFalse: [ announcer announce: (LiReNodeShown node: n) ] ] ].
					announcer announce: (LiReNodeAdded node: n) ] ].
	nodes whenRemovedDo: [ :n | announcer announce: (LiReNodeRemoved node: n) ].
	edges whenAddedDo: [ :e | announcer announce: (LiReEdgeAdded edge: e) ].
	edges whenRemovedDo: [ :e | announcer announce: (LiReEdgeRemoved edge: e) ]