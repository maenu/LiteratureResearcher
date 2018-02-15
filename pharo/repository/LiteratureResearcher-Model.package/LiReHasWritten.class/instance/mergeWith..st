as yet unclassified
mergeWith: anEntity
	super mergeWith: anEntity.
	anEntity email ifNotNil: [ :e | self email: e ].
	anEntity institution ifNotNil: [ :e | self institution: e ].
	anEntity country ifNotNil: [ :e | self country: e ]