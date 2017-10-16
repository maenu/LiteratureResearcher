accessing
source: anObject
	(anObject class == sourceClass or: [ anObject class inheritsFrom: sourceClass ])
		ifFalse: [ self signal: 'Source "' , anObject asString , '" must be compatible with class "' , sourceClass asString , '"' ].
	source := anObject