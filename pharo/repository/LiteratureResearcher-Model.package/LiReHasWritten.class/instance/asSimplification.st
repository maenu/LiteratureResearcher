converting
asSimplification
	^ super asSimplification
		addAll:
			{(#email -> email).
			(#institution -> institution).
			(#country -> country)} asDictionary;
		yourself