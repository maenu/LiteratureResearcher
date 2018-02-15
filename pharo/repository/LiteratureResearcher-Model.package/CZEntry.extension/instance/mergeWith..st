*LiteratureResearcher-Model
mergeWith: anEntry
	anEntry key = 'GENERATED'
		ifFalse: [ self
				key: anEntry key;
				type: anEntry type ].
	(anEntry fields reject: [ :f | self hasField: f key ]) do: [ :f | self at: f key put: f rawValue ]