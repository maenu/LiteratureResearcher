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
								contents) trimmed ])).
			(#titleLink -> (self titleLink ifNotNil: [ :e | e asSimplification ]))} asDictionary;
		yourself