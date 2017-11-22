testing
key
	^ bibtex ifNil: [ '' ] ifNotNil: [ (bibtex at: #title) value ]