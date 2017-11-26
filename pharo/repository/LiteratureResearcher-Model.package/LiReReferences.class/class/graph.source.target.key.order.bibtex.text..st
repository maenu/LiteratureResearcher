instance creation
graph: aGraph source: aNode target: anotherNode key: aString order: anInteger bibtex: aBibtex text: anotherString
	^ (self
		graph: aGraph
		source: aNode
		target: anotherNode
		key: aString
		order: anInteger)
		bibtex: aBibtex;
		text: anotherString;
		yourself