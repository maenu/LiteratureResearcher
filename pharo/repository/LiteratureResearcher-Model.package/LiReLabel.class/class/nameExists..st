as yet unclassified
nameExists: aString
	^ self allInstances anySatisfy: [ :l | l asString = aString ]