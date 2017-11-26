instance creation
name: aString
	^ self allInstances
		detect: [ :l | l name = aString ]
		ifNone: [ self new
				name: aString;
				color: Color white;
				yourself ]