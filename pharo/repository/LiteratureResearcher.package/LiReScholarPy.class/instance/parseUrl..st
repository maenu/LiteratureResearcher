parsing
parseUrl: aString
	^ aString = 'None'
		ifTrue: [ ^ nil ]
		ifFalse: [ ZnUrl fromString: aString ]