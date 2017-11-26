matching
matchKey
	^ bibtex ifNil: [ '' ] ifNotNil: [ (bibtex at: #title) value ]