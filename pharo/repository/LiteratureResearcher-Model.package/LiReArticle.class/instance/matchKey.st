matching
matchKey
	^ self bibtex ifNil: [ '' ] ifNotNil: [ :e | (e at: #title) value ]