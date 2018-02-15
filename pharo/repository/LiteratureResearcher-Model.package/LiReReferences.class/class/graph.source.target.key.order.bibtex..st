instance creation
graph: aGraph source: aNode target: anotherNode key: aString order: anInteger bibtex: aBibtex
	^ (self
		graph: aGraph
		source: aNode
		target: anotherNode
		key: aString
		order: anInteger)
		bibtex: aBibtex;
		yourself