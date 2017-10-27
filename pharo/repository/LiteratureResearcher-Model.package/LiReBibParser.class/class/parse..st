parsing
parse: aString
	"CZBibParser is unforgiving for last fields in an entry ending with a comma."

	| text |
	text := aString asText.
	^ super
		parse: (text asString copyWithRegex: ',\s*\}\s*(?=@|$)' matchesReplacedWith: String lf , '}' , String lf)