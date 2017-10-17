testing
matches: aString
	^ (bibtex at: #title) value asLowercase includesSubstring: aString asLowercase