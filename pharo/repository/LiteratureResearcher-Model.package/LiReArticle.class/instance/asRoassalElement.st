converting
asRoassalElement
	^ (RTBox new
		size: 32;
		color: [ :e | state color ];
		yourself) elementOn: self