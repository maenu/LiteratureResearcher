initialization
findInGraph: anItem
	^ node graph nodes detect: [ :n | n matches: (anItem at: #title) ] ifNone: [ nil ]