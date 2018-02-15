invalidation
invalidateBibtex
	| oldKey keyBaseName keyBaseYear keyBase keyCount |
	(self graph isNil or: [ self bibtex isNil ])
		ifTrue: [ self flag: 'TODO ugly'.
			^ self ].
	oldKey := self bibtex key.
	keyBaseName := 'Xxxx'.
	keyBaseYear := 'YY'.
	keyCount := 'a'.
	(self bibtex hasField: #author)
		ifTrue: [ [ | firstAuthor lastName |
			firstAuthor := (self bibtex at: #author) rawValueObject people at: 1.
			lastName := (' ' join: firstAuthor lastNames) asCamelCase.
			lastName ifNotEmpty: [ keyBaseName := lastName copyFrom: 1 to: (4 min: lastName size) ] ]
				on: SmaCCParserError
				do: [ :e | 
					Transcript
						show: e;
						cr ] ].
	(self bibtex hasField: #year)
		ifTrue: [ | year |
			year := (self bibtex at: #year) value asString.
			year size = 4
				ifTrue: [ keyBaseYear := year copyFrom: 3 to: 4 ] ].
	keyBase := keyBaseName , keyBaseYear.
	(oldKey beginsWith: keyBase)
		ifTrue: [ ^ self ].
	(((self graph nodesOfClass: LiReArticle) select: [ :n | n bibtex key beginsWith: keyBase ])
		collect: [ :n | 
			| key |
			key := n bibtex key.
			key copyFrom: keyBase size to: key size ]) ifNotEmpty: [ :c | keyCount := self class nextKeyCount: c ].
	self bibtex key: keyBase , keyCount.
	(self bibtex hasField: #pdf)
		ifTrue: [ self graph announcer announce: (LiReRequestPdfMove article: self) ].
	self propertyChanged: #bibtex