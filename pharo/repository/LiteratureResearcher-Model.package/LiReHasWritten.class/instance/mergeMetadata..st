as yet unclassified
mergeMetadata: anAssociation
	anAssociation key ifNotNil: [ :e | order := e ].
	(anAssociation value at: #stringName ifAbsent: nil) ifNotNil: [ :e | key := e ].
	(anAssociation value at: #email ifAbsent: nil) ifNotNil: [ :e | email := e ].
	(anAssociation value at: #institution ifAbsent: nil) ifNotNil: [ :e | institution := e ].
	(anAssociation value at: #country ifAbsent: nil) ifNotNil: [ :e | country := e ]