instance creation
fromText: aString graph: aGraph
	^ (super fromText: aString graph: aGraph)
		name: aString;
		yourself