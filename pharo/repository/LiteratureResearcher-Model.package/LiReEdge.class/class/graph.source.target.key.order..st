instance creation
graph: aGraph source: aNode target: anotherNode key: aString order: anInteger
	^ (self graph: aGraph)
		source: aNode;
		target: anotherNode;
		key: aString;
		order: anInteger;
		yourself