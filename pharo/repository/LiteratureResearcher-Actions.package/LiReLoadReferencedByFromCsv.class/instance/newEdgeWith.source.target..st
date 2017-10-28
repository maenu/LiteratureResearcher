instance creation
newEdgeWith: aDictionary source: aNode target: anotherNode
	^ LiReReferences
		graph: aNode graph
		source: aNode
		target: anotherNode
		key: ''
		order: -1
		bibtex: nil
		text: ''
		csv: aDictionary