execution
newBibtexWith: aDictionary
	| bibtex |
	bibtex := CZEntry type: CZEntry article.
	bibtex key: 'GENERATED'.
	aDictionary
		at: #title ifPresent: [ :e | bibtex at: #title put: e ];
		at: #author ifPresent: [ :e | bibtex at: #author put: e ];
		at: #year ifPresent: [ :e | bibtex at: #year put: e ];
		at: #numCitations ifPresent: [ :e | bibtex at: #citations put: e ];
		at: #numVersions ifPresent: [ :e | bibtex at: #versions put: e ];
		at: #urlcitation ifPresent: [ :e | bibtex at: #urlcitation put: e ];
		at: #excerpt ifPresent: [ :e | bibtex at: #abstract put: (e copyWithRegex: '\{|\}' matchesReplacedWith: '') ];
		at: #urlPdf ifPresent: [ :e | bibtex at: #url put: e ];
		at: #url ifPresent: [ :e | bibtex at: #url put: e ];
		at: #clusterId ifPresent: [ :e | bibtex at: #clusterid put: e ].
	^ bibtex