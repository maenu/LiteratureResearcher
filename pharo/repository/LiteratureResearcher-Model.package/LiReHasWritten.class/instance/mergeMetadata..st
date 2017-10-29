as yet unclassified
mergeMetadata: anAssociation
	anAssociation key ifNotNil: [ :e | order := e ].
	(anAssociation value at: #stringName) ifNotNil: [ :e | key := e ].
	(anAssociation value at: #email) ifNotNil: [ :e | email := e ].
	(anAssociation value at: #institution) ifNotNil: [ :e | institution := e ].
	(anAssociation value at: #country) ifNotNil: [ :e | country := e ]