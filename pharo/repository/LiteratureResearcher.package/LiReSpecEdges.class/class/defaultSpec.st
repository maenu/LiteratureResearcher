specs
defaultSpec
	^ SpecLayout composed
		newColumn: [ :column | column add: #list ] origin: 0 @ 0 corner: 0.5 @ 1;
		newColumn: [ :column | column add: #search ] origin: 0.5 @ 0 corner: 1 @ 1;
		yourself