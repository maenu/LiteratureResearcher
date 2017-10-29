as yet unclassified
graph: aGraph source: aNode target: anotherNode metadata: anAssociation
	^ (self graph: aGraph)
		source: aNode;
		target: anotherNode;
		mergeMetadata: anAssociation;
		yourself