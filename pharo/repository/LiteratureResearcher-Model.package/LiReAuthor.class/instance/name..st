accessing
name: anObject
	| oldValue |
	oldValue := name.
	name := anObject.
	oldValue == name
		ifFalse: [ announcer
				announce:
					(LiRePropertyChanged
						instance: self
						property: #name
						oldValue: oldValue
						newValue: name) ]