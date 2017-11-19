converting
asSimplification
	^ super asSimplification
		addAll:
			{(#key -> key).
			(#order -> order)} asDictionary;
		yourself