instance creation
newReferenceAt: anInteger withBibtex: aBibtex dictionary: aDictionary
	^ LiReReferences
		graph: nil
		source: nil
		target: nil
		key: (aDictionary at: #key ifAbsent: nil)
		order: anInteger
		bibtex: aBibtex