tests
testProcessPdfWith
	| result |
	result := cermine processPdf: id with: pdf outputs: outputs.
	self assert: (outputs allSatisfy: [ :output | (result includesKey: output) and: [ (result at: output) exists ] ])