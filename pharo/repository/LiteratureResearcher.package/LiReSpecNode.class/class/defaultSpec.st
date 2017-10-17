specs
defaultSpec
	^ SpecLayout composed
		newRow: [ :row | row add: #tabManager ];
		yourself