accessing
graph: aGraph bibtex: aBibtexEntry metadata: aDocument
	^ (self graph: aGraph)
		bibtex: aBibtexEntry;
		metadata: aDocument;
		yourself