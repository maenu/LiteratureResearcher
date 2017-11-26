instance creation
graph: aGraph bibtex: aBibtexEntry csv: aDictionary document: aDocument
	^ (self graph: aGraph)
		bibtex: aBibtexEntry;
		csv: aDictionary;
		document: aDocument;
		yourself