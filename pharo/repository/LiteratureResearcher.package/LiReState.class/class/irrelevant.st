states
irrelevant
	^ Irrelevant
		ifNil: [ Irrelevant := self new
				index: 2;
				name: 'irrelevant';
				color: (self colorFromCss: '#b4b4b4');
				yourself ]