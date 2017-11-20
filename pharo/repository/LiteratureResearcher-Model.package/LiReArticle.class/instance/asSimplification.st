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
			(#csv -> csv).
			(#document -> (document ifNotNil: [ :d | d fullPrintString ]))} asDictionary;
		yourself