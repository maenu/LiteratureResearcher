accessing
key: anObject
	| oldValue |
	oldValue := key.
	key := anObject.
	self invalidateLink.
	oldValue == key
		ifFalse: [ announcer
				announce:
					(LiRePropertyChanged
						instance: self
						property: #key
						oldValue: oldValue
						newValue: key) ]