accessing
asString
	^ bibtex key asString , ', ' , (bibtex at: #title) value