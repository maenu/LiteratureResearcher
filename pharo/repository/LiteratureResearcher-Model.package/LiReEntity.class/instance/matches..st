testing
matches: aString
	^ (self key asLowercase levenshteinDistanceTo: aString asLowercase) / (self key size min: aString size) < 0.1