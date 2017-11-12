testing
matches: aString
	^ bibtex isNotNil and: [ (bibtex at: #title) value asLowercase includesSubstring: aString asLowercase ]