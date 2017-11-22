*LiteratureResearcher-Model
levenshteinDistanceTo: aString
	^ PHEngineEnglish new levenshteinDistanceOf: (PHWord with: self) With: (PHWord with: aString)