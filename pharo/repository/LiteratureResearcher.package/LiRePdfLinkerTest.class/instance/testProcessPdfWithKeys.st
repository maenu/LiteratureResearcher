tests
testProcessPdfWithKeys
	| out |
	out := pdfLinker processPdf: id with: pdf keys: keys.
	self assert: out exists