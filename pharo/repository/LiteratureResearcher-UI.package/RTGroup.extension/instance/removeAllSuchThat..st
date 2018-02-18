*LiteratureResearcher-UI
removeAllSuchThat: aBlock
	| result |
	result := super removeAllSuchThat: aBlock.
	Halt now.
	self elementFromModelCache keysAndValuesRemove: [ :k :v | aBlock cull: v ].
	^ result