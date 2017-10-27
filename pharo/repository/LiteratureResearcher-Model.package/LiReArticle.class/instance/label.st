accessing
label
	^ bibtex key asString , ', ' , (bibtex at: #title) value