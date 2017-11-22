target resize
asLinksSimplification: anArticle
	^ {(#id -> anArticle bibtex key).
	(#title -> anArticle titleLink asSimplification).
	(#authors -> ((self asAuthorLinks: anArticle) collect: #asSimplification)).
	(#references -> ((self asReferenceLinks: anArticle) collect: #asSimplification))} asDictionary