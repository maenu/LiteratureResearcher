parsing
parseCsv: aString
	^ ((Character lf split: aString) select: [ :s | s isEmpty not ]) collect: [ :s | self parseCsvRow: s ]