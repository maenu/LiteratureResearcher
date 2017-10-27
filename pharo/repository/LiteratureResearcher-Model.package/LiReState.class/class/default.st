states
default
	^ Default
		ifNil: [ Default := self new
				index: 1;
				name: 'default';
				color: (self colorFromCss: '#949494');
				yourself ]