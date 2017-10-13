tests
testKeywords
	| keywords |
	keywords := extractor keywords.
	self assert: keywords asOrderedCollection equals: {'-Null Checks' . 'Null Usage' . 'Static Analysis'} asOrderedCollection