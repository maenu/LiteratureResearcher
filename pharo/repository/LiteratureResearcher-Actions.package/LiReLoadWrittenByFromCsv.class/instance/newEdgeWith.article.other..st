instance creation
newEdgeWith: aDictionary article: aNode other: anotherNode
	^ LiReHasWritten
		graph: aNode graph
		source: anotherNode
		target: aNode
		key: ''
		order: -1
		email: ''
		institution: ''
		country: ''