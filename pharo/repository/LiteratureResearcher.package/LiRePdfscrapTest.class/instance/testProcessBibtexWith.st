tests
testProcessBibtexWith
	| out |
	out := pdfscrap processBibtex: bibtex.
	self assert: out exists