parsing
parseCsv: aString
	^ ((Character lf split: aString) reject: [ :s | s isEmpty ])
		collect: [ :s | self parseCsvRow: s ]