instance creation
newBibtex
	^ self newText
		acceptBlock: [ :s | article bibtex: (CZBibParser parse: s) ];
		yourself