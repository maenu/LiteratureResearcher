converting
asTitleLink: anArticle
	^ {(#id -> anArticle bibtex key).
	(#key -> anArticle bibtex title value).
	(#color -> (anArticle asColor rgbTriplet * 255))} asDictionary