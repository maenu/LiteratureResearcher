accessing
document: anObject
	| oldValue |
	oldValue := document.
	document := anObject.
	oldValue == document
		ifFalse: [ announcer
				announce:
					(LiRePropertyChanged
						instance: self
						property: #document
						oldValue: oldValue
						newValue: document) ]