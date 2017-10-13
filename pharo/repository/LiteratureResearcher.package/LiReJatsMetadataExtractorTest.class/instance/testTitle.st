tests
testTitle
	| title |
	title := extractor title.
	self assert: title equals: 'Tracking Null Checks in Open-Source Java Systems'