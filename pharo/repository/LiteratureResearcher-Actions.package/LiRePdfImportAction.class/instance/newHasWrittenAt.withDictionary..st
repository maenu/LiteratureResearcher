instance creation
newHasWrittenAt: anInteger withDictionary: aDictionary
	^ LiReHasWritten
		graph: nil
		source: nil
		target: nil
		key: (aDictionary at: #stringName ifAbsent: nil)
		order: anInteger
		email: (aDictionary at: #email ifAbsent: nil)
		institution: (aDictionary at: #institution ifAbsent: nil)
		country: (aDictionary at: #country ifAbsent: nil)