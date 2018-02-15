converting
asSimplification
	^ super asSimplification
		addAll:
			{(#email -> self email).
			(#institution -> self institution).
			(#country -> self country)} asDictionary;
		yourself