as yet unclassified
graph: aGraph source: aNode target: anotherNode key: aString
	^ (self graph: aGraph)
		source: aNode;
		target: anotherNode;
		key: aString;
		yourself