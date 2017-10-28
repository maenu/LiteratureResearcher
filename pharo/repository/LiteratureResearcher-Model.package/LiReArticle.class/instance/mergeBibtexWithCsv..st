as yet unclassified
mergeBibtexWithCsv: aDictionary
	((aDictionary at: #urlPdf) ifNil: [ aDictionary at: #url ]) ifNotNil: [ :url | bibtex at: #url put: url ].
	(aDictionary at: #clusterId) ifNotNil: [ :clusterId | bibtex at: #clusterid put: clusterId ].
	self propertyChanged: #bibtex