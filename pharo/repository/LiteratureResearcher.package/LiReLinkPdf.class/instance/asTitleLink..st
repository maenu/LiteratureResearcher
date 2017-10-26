converting
asTitleLink: anArticle
	^ {(#id -> anArticle bibtex key).
	(#key -> anArticle bibtex title value).
	(#color -> anArticle state color rgbTriplet)} asDictionary