private
sanitize: aString
	"CZBibParser is unforgiving for last fields in an entry ending with a comma."

	| sanitized |
	sanitized := aString copyWithRegex: ',\s*\}\s*@' matchesReplacedWith: String lf , '}' , String lf , '@'.
	sanitized := sanitized copyWithRegex: ',\s*\}\s*$' matchesReplacedWith: String lf , '}' , String lf.
	sanitized := sanitized copyWithRegex: 'year\s*=\s*\{([^}]*)\}' matchesTranslatedUsing: [ :s | 'year={' , s asInteger asString , '}' ].
	sanitized := sanitized
		copyWithRegex: '(([' , String lf , String cr , ']|^)@[^{]+\{[^,]+,)'
		matchesTranslatedUsing: [ :s | String lf , (s copyReplaceAll: ' ' with: '') ].
	^ sanitized