*LiteratureResearcher-UI
removeAll
	| result |
	result := super removeAll.
	self resetElementFromModelCache.
	^ result