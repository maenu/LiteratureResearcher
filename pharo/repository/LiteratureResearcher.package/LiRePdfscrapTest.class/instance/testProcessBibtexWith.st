tests
testProcessBibtexWith
	| out |
	out := pdfscrap processBibtex: id with: bibtex.
	self assert: out exists