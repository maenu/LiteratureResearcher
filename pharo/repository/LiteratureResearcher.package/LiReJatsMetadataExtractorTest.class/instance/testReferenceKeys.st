tests
testReferenceKeys
	| keys |
	keys := extractor referenceKeys.
	self assert: keys equals: ((1 to: 35) collect: [ :i | '[' , i asString , ']' ]) asOrderedCollection