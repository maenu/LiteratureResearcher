converting
asSimplification
	^ super asSimplification
		addAll: {(#name -> name)} asDictionary;
		yourself