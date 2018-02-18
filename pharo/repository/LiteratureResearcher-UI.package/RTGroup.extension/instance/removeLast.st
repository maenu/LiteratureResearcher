*LiteratureResearcher-UI
removeLast
	| result |
	result := super removeLast.
	Halt now.
	self elementFromModelCache keysAndValuesRemove: [ :k :v | v == result ].
	^ result