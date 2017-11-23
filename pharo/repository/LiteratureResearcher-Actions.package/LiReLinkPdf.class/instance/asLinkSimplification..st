target resize
asLinkSimplification: aLink
	| sortedSimplification simplification |
	sortedSimplification := OrderedDictionary new.
	simplification := aLink asSimplification.
	(simplification keys sorted reject: [ :k | k = #class ]) do: [ :k | sortedSimplification at: k asString put: (simplification at: k) ].
	sortedSimplification at: 'key' ifPresent: [ :k | sortedSimplification at: 'key' put: k asString ].
	^ sortedSimplification