testing
matches: aString
	^ ((self key asLowercase levenshteinDistanceTo: aString asLowercase) + 1) / ((self key size min: aString size) + 1) < 0.1