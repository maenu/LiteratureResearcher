converting
asSimplification
	^ super asSimplification
		addAll:
			{(#labels -> (labels collect: [ :l | l asSimplification ])).
			(#hidden -> self hidden)} asDictionary;
		yourself