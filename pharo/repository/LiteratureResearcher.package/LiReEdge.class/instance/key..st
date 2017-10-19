accessing
key: anObject
	| oldValue |
	oldValue := key.
	key := anObject.
	oldValue == key
		ifFalse: [ announcer
				announce:
					(LiRePropertyChanged
						instance: self
						property: #key
						oldValue: oldValue
						newValue: key) ]