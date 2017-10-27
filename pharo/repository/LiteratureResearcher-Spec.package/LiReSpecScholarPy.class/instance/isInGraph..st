initialization
isInGraph: anItem
	^ graph nodes anySatisfy: [ :n | n matches: (anItem at: #title) ]