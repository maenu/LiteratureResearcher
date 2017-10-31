private
sanitize: aString
	| sanitized |
	sanitized := aString copyWithRegex: ',\s*\}\s*($|@)' matchesTranslatedUsing: [ :s | s copyReplaceAll: ',' with: '' ].
	sanitized := sanitized copyWithRegex: 'year\s*=\s*\{([^}]*)\}' matchesTranslatedUsing: [ :s | 'year=' , s asInteger asString ].
	sanitized := sanitized
		copyWithRegex: '(^|' , String lf , '|' , String cr , ')@[^{]+\{[^,]+,'
		matchesTranslatedUsing: [ :s | String lf , '@' , (s copyWithRegex: '[^a-zA-Z0-9{]' matchesReplacedWith: '') , ',' ].
	^ sanitized