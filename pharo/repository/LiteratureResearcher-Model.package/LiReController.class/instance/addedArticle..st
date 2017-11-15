as yet unclassified
addedArticle: anArticle
	self normalizeArticle: anArticle.
	anArticle announcer
		when: LiRePropertyChanged
		do: [ :e | 
			e property = #bibtex
				ifTrue: [ self normalizeArticle: e instance ] ]