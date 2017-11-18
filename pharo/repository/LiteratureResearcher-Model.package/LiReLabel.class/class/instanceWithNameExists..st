as yet unclassified
instanceWithNameExists: aString
	^ self allInstances anySatisfy: [ :l | l asString = aString ]