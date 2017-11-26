invalidation
invalidateBibtex
	| oldKey keyBaseName keyBaseYear keyBase keyCount |
	oldKey := bibtex key.
	keyBaseName := 'Xxxx'.
	keyBaseYear := 'YY'.
	keyCount := 'a'.
	(bibtex hasField: #author)
		ifTrue: [ [ | firstAuthor lastName |
			firstAuthor := (bibtex at: #author) rawValueObject people at: 1.
			lastName := (' ' join: firstAuthor lastNames) asCamelCase.
			lastName ifNotEmpty: [ keyBaseName := lastName copyFrom: 1 to: (4 min: lastName size) ] ]
				on: SmaCCParserError
				do: [ :e | 
					Transcript
						show: e;
						cr ] ].
	(bibtex hasField: #year)
		ifTrue: [ | year |
			year := (bibtex at: #year) value asString.
			year size = 4
				ifTrue: [ keyBaseYear := year copyFrom: 3 to: 4 ] ].
	keyBase := keyBaseName , keyBaseYear.
	(oldKey beginsWith: keyBase)
		ifTrue: [ ^ self ].
	(((graph nodesOfClass: LiReArticle) select: [ :n | n bibtex key beginsWith: keyBase ])
		collect: [ :n | 
			| key |
			key := n bibtex key.
			key copyFrom: keyBase size to: key size ]) ifNotEmpty: [ :c | keyCount := self class nextKeyCount: c ].
	bibtex key: keyBase , keyCount.
	(bibtex hasField: #pdf)
		ifTrue: [ announcer announce: (LiReRequestMovePdf article: self) ].
	self propertyChanged: #bibtex