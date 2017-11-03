tests
testProcessPdfWithTitleAuthorsAffiliationsReferences
	| out |
	out := pdfLinker
		processPdf: id
		with: pdf
		title: title
		authors: authors
		references: references.
	self assert: out exists