instance creation
graph: aGraph source: aNode target: anotherNode metadata: anAssociation
	self flag: 'this is weird'.
	^ (self graph: aGraph)
		source: aNode;
		target: anotherNode;
		mergeMetadata: anAssociation;
		yourself