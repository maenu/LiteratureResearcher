accessing
at: aSymbol
	| controller |
	controller := dictionary at: aSymbol ifAbsent: [ self at: aSymbol put: self newDefaultController ].
	self startServerFor: controller.
	^ controller