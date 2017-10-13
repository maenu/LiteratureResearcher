tests
testProcessPdfWith
	| result |
	result := cermine processPdf: id with: pdf.
	self assert: (outputs allSatisfy: [ :output | (result includesKey: output) and: [ (result at: output) exists ] ])