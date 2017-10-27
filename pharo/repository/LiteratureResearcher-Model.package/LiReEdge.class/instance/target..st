accessing
target: anObject
	| oldValue |
	oldValue := target.
	target := anObject.
	oldValue == target
		ifFalse: [ announcer
				announce:
					(LiRePropertyChanged
						instance: self
						property: #target
						oldValue: oldValue
						newValue: target) ]