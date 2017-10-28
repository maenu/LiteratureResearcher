as yet unclassified
graph: aGraph source: aNode target: anotherNode key: aString order: anInteger bibtex: aBibtex text: anotherString csv: aDictionary
	^ (self
		graph: aGraph
		source: aNode
		target: anotherNode
		key: aString
		order: anInteger)
		bibtex: aBibtex;
		text: anotherString;
		csv: aDictionary;
		yourself