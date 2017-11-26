as yet unclassified
normalizeLinksSimplification: aSimplification
	| sortedSimplification |
	sortedSimplification := OrderedDictionary new.
	sortedSimplification at: 'id' put: (aSimplification at: 'id').
	sortedSimplification at: 'title' put: (self normalizeLinkSimplification: (aSimplification at: 'title')).
	sortedSimplification at: 'authors' put: (((aSimplification at: 'authors') collect: [ :l | self normalizeLinkSimplification: l ]) sorted: [ :a :b | (a at: 'key') < (b at: 'key') ]).
	sortedSimplification at: 'references' put: (((aSimplification at: 'references') collect: [ :l | self normalizeLinkSimplification: l ]) sorted: [ :a :b | (a at: 'key') < (b at: 'key') ]).
	^ sortedSimplification