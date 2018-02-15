converting
asSimplification
	^ super asSimplification
		addAll:
			{(#bibtex
				->
					(self bibtex
						ifNotNil: [ :b | 
							(LiReBibRenderer new
								render: b;
								contents) trimmed ]))} asDictionary;
		yourself