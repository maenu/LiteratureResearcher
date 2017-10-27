accessing
value
	lock isSignaled
		ifFalse: [ lock wait ].
	error
		ifNotNil: [ error
				privHandlerContext: thisContext;
				signal ].
	^ value