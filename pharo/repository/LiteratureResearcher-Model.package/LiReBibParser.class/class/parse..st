parsing
parse: aString
	^ super parse: (LiReBibRenderer sanitize: aString asString)