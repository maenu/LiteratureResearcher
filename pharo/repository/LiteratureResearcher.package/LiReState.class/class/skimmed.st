states
skimmed
	^ Skimmed
		ifNil: [ Skimmed := self new
				index: 4;
				name: 'skimmed';
				color: (self colorFromCss: '#5c95be');
				yourself ]