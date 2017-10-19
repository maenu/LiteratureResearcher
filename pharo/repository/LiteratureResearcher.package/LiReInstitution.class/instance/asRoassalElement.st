converting
asRoassalElement
	^ (RTRoundedBox new
		borderRadius: 1;
		size: 32;
		color: [ state color ];
		yourself) elementOn: self