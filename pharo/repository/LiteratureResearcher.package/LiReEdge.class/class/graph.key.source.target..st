as yet unclassified
graph: aGraph key: aString source: aNode target: anotherNode
	^ (self graph: aGraph)
		key: aString;
		source: aNode;
		target: anotherNode;
		yourself