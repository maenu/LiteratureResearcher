accessing
csv: anObject
	| oldValue |
	oldValue := csv.
	csv := anObject.
	oldValue == csv
		ifFalse: [ announcer
				announce:
					(LiRePropertyChanged
						instance: self
						property: #csv
						oldValue: oldValue
						newValue: csv) ]