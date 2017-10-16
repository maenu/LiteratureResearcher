specs
defaultSpec
	^ SpecLayout composed
		newRow: [ :row | row add: #tabManager ] origin: 0 @ 0 corner: 1 @ 1;
		yourself