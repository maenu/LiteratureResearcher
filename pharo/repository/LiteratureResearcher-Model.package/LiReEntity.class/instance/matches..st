testing
matches: aString
	^ ((self key asLowercase levenshteinDistanceTo: aString asLowercase) - (self key size - aString size) abs + 0.001) / ((self key size min: aString size) + 0.001) < 0.1