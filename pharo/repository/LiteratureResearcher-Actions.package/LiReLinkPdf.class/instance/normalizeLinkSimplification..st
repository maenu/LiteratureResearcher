target resize
normalizeLinkSimplification: aSimplification
	| sortedSimplification |
	sortedSimplification := OrderedDictionary new.
	(aSimplification keys sorted reject: [ :k | k = 'class' ]) do: [ :k | sortedSimplification at: k asString put: (aSimplification at: k) ].
	sortedSimplification at: 'rectangle' ifPresent: [ :r | sortedSimplification at: 'rectangle' put: (r collect: [ :n | n round: 2 ]) ].
	^ sortedSimplification