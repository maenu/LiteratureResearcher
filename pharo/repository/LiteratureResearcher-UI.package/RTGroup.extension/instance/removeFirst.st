*LiteratureResearcher-UI
removeFirst
	| result |
	result := super removeFirst.
	Halt now.
	self elementFromModelCache keysAndValuesRemove: [ :k :v | v == result ].
	^ result