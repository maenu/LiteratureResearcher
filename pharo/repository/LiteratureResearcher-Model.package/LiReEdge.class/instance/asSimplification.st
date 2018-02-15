converting
asSimplification
	^ super asSimplification
		addAll:
			{(#key -> self key).
			(#order -> self order).
			(#link -> (self link ifNotNil: [ :e | e asSimplification ]))} asDictionary;
		yourself