initialization
initialize
	super initialize.
	hidden := NewValueHolder value: true.
	labels := (LiReSortedSet sortBlock: LiReLabel sortBlock) asValueHolder.
	self observeProperty: #hidden.
	labels
		whenAddedDo: [ :l | 
			announcer
				announce:
					(LiRePropertyChanged
						instance: self
						property: #labels
						oldValue: labels
						newValue: labels) ].
	labels
		whenRemovedDo: [ :l | 
			announcer
				announce:
					(LiRePropertyChanged
						instance: self
						property: #labels
						oldValue: labels
						newValue: labels) ]