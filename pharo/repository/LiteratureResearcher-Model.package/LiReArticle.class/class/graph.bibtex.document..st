accessing
graph: aGraph bibtex: aBibtexEntry document: aDocument
	^ (self graph: aGraph)
		bibtex: aBibtexEntry;
		document: aDocument;
		yourself