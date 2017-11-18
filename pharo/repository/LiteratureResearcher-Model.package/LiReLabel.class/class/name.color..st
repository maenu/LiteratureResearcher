as yet unclassified
name: aString color: aColor
	self assert: [ (self instanceWithNameExists: aString) not ].
	^ self new
		name: aString;
		color: aColor;
		yourself