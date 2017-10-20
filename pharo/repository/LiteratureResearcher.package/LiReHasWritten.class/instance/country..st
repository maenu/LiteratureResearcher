accessing
country: anObject
	| oldValue |
	oldValue := country.
	country := anObject.
	oldValue == country
		ifFalse: [ announcer
				announce:
					(LiRePropertyChanged
						instance: self
						property: #country
						oldValue: oldValue
						newValue: country) ]