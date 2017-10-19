accessing
graph: anObject
	| oldValue |
	oldValue := graph.
	graph := anObject.
	oldValue == graph
		ifFalse: [ announcer
				announce:
					(LiRePropertyChanged
						instance: self
						property: #graph
						oldValue: oldValue
						newValue: graph) ]