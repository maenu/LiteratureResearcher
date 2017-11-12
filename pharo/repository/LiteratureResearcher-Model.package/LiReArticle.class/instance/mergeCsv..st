as yet unclassified
mergeCsv: aDictionary
	(aDictionary associations reject: [ :a | csv includesKey: a key ]) do: [ :a | csv at: a key put: a value ].
	self propertyChanged: #csv