states
processing
	^ Processing
		ifNil: [ Processing := self new
				index: 5;
				name: 'processing';
				color: (self colorFromCss: '#88b3d1');
				yourself ]