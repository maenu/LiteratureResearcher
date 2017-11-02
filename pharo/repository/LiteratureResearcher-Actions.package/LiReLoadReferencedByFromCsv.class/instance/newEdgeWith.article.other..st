instance creation
newEdgeWith: aDictionary article: aNode other: anotherNode
	^ LiReReferences
		graph: aNode graph
		source: aNode
		target: anotherNode
		key: ''
		order: -1
		bibtex: nil
		text: ''
		csv: aDictionary