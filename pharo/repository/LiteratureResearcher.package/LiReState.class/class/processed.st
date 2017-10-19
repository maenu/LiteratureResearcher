states
processed
	^ Processed
		ifNil: [ Processed := self new
				index: 6;
				name: 'processed';
				color: (self colorFromCss: '#b6d1e4');
				yourself ]