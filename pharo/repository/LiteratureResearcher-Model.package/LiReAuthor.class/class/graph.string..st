instance creation
graph: aGraph string: aString
	^ (super graph: aGraph string: aString)
		name: aString;
		yourself