converting
asSimplification
	^ super asSimplification
		addAll:
			{(#name -> name).
			(#color -> color asHexString)} asDictionary;
		yourself