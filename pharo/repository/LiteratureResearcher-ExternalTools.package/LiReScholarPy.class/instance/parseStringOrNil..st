parsing
parseStringOrNil: aString
	^ aString = 'None'
		ifTrue: [ ^ nil ]
		ifFalse: [ aString ]