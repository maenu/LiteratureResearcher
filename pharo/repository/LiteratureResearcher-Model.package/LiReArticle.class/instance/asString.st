converting
asString
	^ self bibtex key asString , ', ' , (self bibtex at: #title) value