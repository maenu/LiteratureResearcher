initialization
initialize
	super initialize.
	labels := (LiReSortedSet sortBlock: LiReLabel sortBlock) asValueHolder.
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