accessing
state: anObject
	| oldValue |
	oldValue := state.
	state := anObject.
	oldValue == state
		ifFalse: [ announcer
				announce:
					(LiRePropertyChanged
						instance: self
						property: #state
						oldValue: oldValue
						newValue: state) ]