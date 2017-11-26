adding
add: anObject
	(self includes: anObject)
		ifFalse: [ super add: anObject ].
	^ anObject