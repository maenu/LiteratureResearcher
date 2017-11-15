as yet unclassified
mergeCsv: aDictionary
	| bibtexChanged |
	bibtexChanged := false.
	(aDictionary associations reject: [ :a | csv includesKey: a key ]) do: [ :a | csv at: a key put: a value ].
	self propertyChanged: #csv.
	((csv includesKey: #excerpt) and: [ (bibtex hasField: #abstract) not ])
		ifTrue: [ bibtex at: #abstract put: (csv at: #excerpt).
			bibtexChanged := true ].
	((csv includesKey: #url) and: [ (bibtex hasField: #url) not ])
		ifTrue: [ bibtex at: #url put: (csv at: #url).
			bibtexChanged := true ].
	((csv includesKey: #urlPdf) and: [ (bibtex hasField: #url) not ])
		ifTrue: [ bibtex at: #url put: (csv at: #urlPdf).
			bibtexChanged := true ].
	((csv includesKey: #clusterId) and: [ (bibtex hasField: #clusterid) not ])
		ifTrue: [ bibtex at: #clusterid put: (csv at: #clusterId).
			bibtexChanged := true ].
	bibtexChanged
		ifTrue: [ self propertyChanged: #bibtex ]