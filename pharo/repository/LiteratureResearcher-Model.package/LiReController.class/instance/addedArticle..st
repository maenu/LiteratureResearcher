as yet unclassified
addedArticle: anArticle
	self normalizeArticle: anArticle.
	anArticle announcer
		when: LiRePropertyChanged
		do: [ :a | 
			a property = #bibtex
				ifTrue: [ self normalizeArticle: a instance ].
			a then value ]