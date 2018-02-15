execution
executeWith: anArticle start: anInteger count: anotherInteger
	(anArticle bibtex hasField: #clusterid)
		ifFalse: [ searchOneClusterId executeWith: {anArticle} ].
	^ scholarPy findCitations: (anArticle bibtex at: #clusterid) value start: anInteger count: anotherInteger