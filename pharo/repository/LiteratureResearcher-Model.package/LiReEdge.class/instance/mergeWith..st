as yet unclassified
mergeWith: anEntity
	anEntity key ifNotNil: [ :e | self key: e ].
	anEntity order ifNotNil: [ :e | self order: e ].
	anEntity link ifNotNil: [ :e | self link: e ]