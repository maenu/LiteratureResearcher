instance creation
graph: aGraph name: aString email: anotherString
	^ (self graph: aGraph)
		name: aString;
		email: anotherString;
		yourself