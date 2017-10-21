parsing
parse: aString
	"CZBibParser is unforgiving for last fields in an entry ending with a comma."

	^ super parse: (aString asString copyWithRegex: ',\s*\}\s*(?=@|$)' matchesReplacedWith: String lf , '}' , String lf)