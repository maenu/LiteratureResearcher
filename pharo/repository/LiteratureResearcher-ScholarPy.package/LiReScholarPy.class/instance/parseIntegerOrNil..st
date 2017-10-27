parsing
parseIntegerOrNil: aString
	^ aString = 'None'
		ifTrue: [ ^ nil ]
		ifFalse: [ aString asInteger ]