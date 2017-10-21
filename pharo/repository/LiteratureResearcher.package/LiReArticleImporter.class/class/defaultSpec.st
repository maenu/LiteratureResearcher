specs
defaultSpec
	^ SpecLayout composed
		newRow: [ :row | row newColumn: #tabManager ];
		yourself