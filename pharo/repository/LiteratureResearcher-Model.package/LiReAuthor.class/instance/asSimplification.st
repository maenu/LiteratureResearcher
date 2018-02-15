converting
asSimplification
	^ super asSimplification
		addAll: {(#name -> self name)} asDictionary;
		yourself