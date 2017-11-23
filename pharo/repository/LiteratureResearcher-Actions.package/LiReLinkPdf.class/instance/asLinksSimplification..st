target resize
asLinksSimplification: anArticle
	^ {('id' -> anArticle bibtex key asString).
	('title' -> (self asLinkSimplification: anArticle titleLink)).
	('authors' -> ((self asAuthorLinks: anArticle) collect: [ :l | self asLinkSimplification: l ]) asSet).
	('references' -> ((self asReferenceLinks: anArticle) collect: [ :l | self asLinkSimplification: l ]) asSet)} asOrderedDictionary