execution
executeWith: aCollection
	^ self executeWithId: (aCollection at: 1) referencingId: (aCollection at: 2)