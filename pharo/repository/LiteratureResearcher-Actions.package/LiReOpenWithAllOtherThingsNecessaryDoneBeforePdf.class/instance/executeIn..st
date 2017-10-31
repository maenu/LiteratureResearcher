target resize
executeIn: anArticle
	(anArticle bibtex hasField: #pdf)
		ifFalse: [ load executeIn: anArticle ].
	anArticle document ifNil: [ import executeIn: anArticle ].
	link executeIn: anArticle.
	open executeIn: anArticle