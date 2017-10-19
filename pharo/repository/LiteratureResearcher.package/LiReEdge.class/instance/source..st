accessing
source: anObject
	| oldValue |
	oldValue := source.
	source := anObject.
	oldValue == source
		ifFalse: [ announcer
				announce:
					(LiRePropertyChanged
						instance: self
						property: #source
						oldValue: oldValue
						newValue: source) ]