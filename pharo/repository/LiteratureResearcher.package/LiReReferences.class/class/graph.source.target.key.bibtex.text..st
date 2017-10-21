as yet unclassified
graph: aGraph source: aNode target: anotherNode key: aString bibtex: aBibtex text: anotherString
	^ (self
		graph: aGraph
		source: aNode
		target: anotherNode
		key: aString)
		bibtex: aBibtex;
		text: anotherString;
		yourself