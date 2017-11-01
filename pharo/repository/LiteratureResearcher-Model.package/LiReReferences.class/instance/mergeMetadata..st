as yet unclassified
mergeMetadata: anAssociation
	anAssociation key ifNotNil: [ :e | order := e ].
	(anAssociation value value at: #key ifAbsent: nil) ifNotNil: [ :e | key := e ].
	anAssociation value key ifNotNil: [ :e | bibtex := e ].
	(anAssociation value value at: #text ifAbsent: nil) ifNotNil: [ :e | text := e ]