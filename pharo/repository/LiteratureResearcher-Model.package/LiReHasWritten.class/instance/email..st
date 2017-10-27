accessing
email: anObject
	| oldValue |
	oldValue := email.
	email := anObject.
	oldValue == email
		ifFalse: [ announcer
				announce:
					(LiRePropertyChanged
						instance: self
						property: #email
						oldValue: oldValue
						newValue: email) ]