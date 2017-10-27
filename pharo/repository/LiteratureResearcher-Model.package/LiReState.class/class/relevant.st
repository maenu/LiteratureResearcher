states
relevant
	^ Relevant
		ifNil: [ Relevant := self new
				index: 3;
				name: 'relevant';
				color: (self colorFromCss: '#3f759b');
				yourself ]