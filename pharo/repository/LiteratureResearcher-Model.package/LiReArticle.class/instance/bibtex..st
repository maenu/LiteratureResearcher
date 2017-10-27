accessing
bibtex: anObject
	| oldValue |
	oldValue := bibtex.
	bibtex := anObject.
	oldValue == bibtex
		ifFalse: [ announcer
				announce:
					(LiRePropertyChanged
						instance: self
						property: #bibtex
						oldValue: oldValue
						newValue: bibtex) ]