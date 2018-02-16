execution
newBibtexWith: aDictionary
	| bibtex |
	bibtex := CZEntry type: CZEntry article.
	bibtex key: 'GENERATED'.
	aDictionary
		at: #title ifPresent: [ :e | e ifNotNil: [ bibtex at: #title put: e ] ];
		at: #author ifPresent: [ :e | e ifNotNil: [ bibtex at: #author put: e ] ];
		at: #year ifPresent: [ :e | e ifNotNil: [ bibtex at: #year put: e ] ];
		at: #numCitations ifPresent: [ :e | e ifNotNil: [ bibtex at: #citations put: e ] ];
		at: #numVersions ifPresent: [ :e | e ifNotNil: [ bibtex at: #versions put: e ] ];
		at: #urlcitation ifPresent: [ :e | e ifNotNil: [ bibtex at: #urlcitation put: e ] ];
		at: #excerpt ifPresent: [ :e | e ifNotNil: [ bibtex at: #abstract put: (e copyWithRegex: '\{|\}' matchesReplacedWith: '') ] ];
		at: #urlPdf ifPresent: [ :e | e ifNotNil: [ bibtex at: #url put: e ] ];
		at: #url ifPresent: [ :e | e ifNotNil: [ bibtex at: #url put: e ] ];
		at: #clusterId ifPresent: [ :e | e ifNotNil: [ bibtex at: #clusterid put: e ] ].
	^ bibtex