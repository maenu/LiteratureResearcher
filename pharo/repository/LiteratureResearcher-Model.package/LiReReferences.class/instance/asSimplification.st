converting
asSimplification
	^ super asSimplification
		addAll:
			{(#bibtex
				->
					(bibtex
						ifNotNil: [ :b | 
							(LiReBibRenderer new
								render: b;
								contents) trimmed ])).
			(#text -> text)} asDictionary;
		yourself