tests
testProcessBibtexWith
	| out |
	out := pdfdbscrap processBibtex: bibtex.
	self assert: out exists