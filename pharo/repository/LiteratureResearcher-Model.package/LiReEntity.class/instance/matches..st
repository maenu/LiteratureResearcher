matching
matches: aString
	^ ((self matchKey asLowercase levenshteinDistanceTo: aString asLowercase) - (self matchKey size - aString size) abs + 0.001) / ((self matchKey size min: aString size) + 0.001) < 0.1