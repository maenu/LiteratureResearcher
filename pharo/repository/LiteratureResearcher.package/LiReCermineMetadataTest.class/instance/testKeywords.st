tests
testKeywords
	| keywords |
	keywords := metadata keywords.
	self assert: keywords asOrderedCollection equals: {'-Null Checks' . 'Null Usage' . 'Static Analysis'} asOrderedCollection