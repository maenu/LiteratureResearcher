as yet unclassified
mergeWith: anEntity
	anEntity name ifNotNil: [ :e | self name: e ]