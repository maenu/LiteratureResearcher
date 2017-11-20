parsing
parseCsvRow: aString
	| row values |
	self flag: 'neocsv has issues with quotes, better make scholar.py csv parsable'.
	row := Dictionary new.
	values := $| split: aString.
	row at: #title put: (self parseStringOrNil: (values at: 1)).
	row at: #author put: (self parseStringOrNil: (values at: 2)).
	row at: #url put: (self parseStringOrNil: (values at: 3)).
	row at: #year put: (self parseIntegerOrNil: (values at: 4)).
	row at: #numCitations put: (self parseIntegerOrNil: (values at: 5)).
	row at: #numVersions put: (self parseIntegerOrNil: (values at: 6)).
	row at: #clusterId put: (self parseStringOrNil: (values at: 7)).
	row at: #urlPdf put: (self parseStringOrNil: (values at: 8)).
	row at: #urlCitations put: (self parseStringOrNil: (values at: 9)).
	row at: #urlVersions put: (self parseStringOrNil: (values at: 10)).
	row at: #urlCitation put: (self parseStringOrNil: (values at: 11)).
	row at: #excerpt put: (self parseStringOrNil: (values at: 12)).
	^ row