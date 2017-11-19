converting
asSimplification
	^ super asSimplification
		addAll: {(#labels -> (labels collect: [ :l | l asSimplification ]))} asDictionary;
		yourself