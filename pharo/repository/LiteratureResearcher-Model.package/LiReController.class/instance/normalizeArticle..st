as yet unclassified
normalizeArticle: anArticle
	| oldKey keyBaseName keyBaseYear keyBase keyCount |
	oldKey := anArticle bibtex key.
	keyBaseName := 'Xxxx'.
	keyBaseYear := 'YY'.
	keyCount := 'a'.
	(anArticle bibtex hasField: #author)
		ifTrue: [ [ | firstAuthor lastName |
			firstAuthor := (anArticle bibtex at: #author) rawValueObject people at: 1.
			lastName := (' ' join: firstAuthor lastNames) asCamelCase.
			lastName ifNotEmpty: [ keyBaseName := lastName copyFrom: 1 to: (4 min: lastName size) ] ]
				on: SmaCCParserError
				do: [ :e | 
					Transcript
						show: e;
						cr ] ].
	(anArticle bibtex hasField: #year)
		ifTrue: [ | year |
			year := (anArticle bibtex at: #year) value asString.
			year size = 4
				ifTrue: [ keyBaseYear := year copyFrom: 3 to: 4 ] ].
	keyBase := keyBaseName , keyBaseYear.
	(oldKey beginsWith: keyBase)
		ifTrue: [ ^ self ].
	((graph nodes select: [ :n | (n isKindOf: LiReArticle) and: [ n bibtex key beginsWith: keyBase ] ])
		collect: [ :n | 
			| key |
			key := n bibtex key.
			key copyFrom: keyBase size to: key size ]) ifNotEmpty: [ :c | keyCount := self nextKeyCount: c ].
	anArticle bibtex key: keyBase , keyCount.
	(anArticle bibtex hasField: #pdf)
		ifTrue: [ actionMovePdf executeIn: anArticle ].
	anArticle propertyChanged: #bibtex