accessing
target: anObject
	(anObject class == targetClass or: [ anObject class inheritsFrom: targetClass ])
		ifFalse: [ self signal: 'Target "' , anObject asString , '" must be compatible with class "' , targetClass asString , '"' ].
	target := anObject