converting
asSimplification
	^ super asSimplification
		addAll:
			{(#key -> key).
			(#order -> order).
			(#link -> (link ifNotNil: [ link asSimplification ]))} asDictionary;
		yourself