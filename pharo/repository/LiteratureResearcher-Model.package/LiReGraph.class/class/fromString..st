instance creation
fromString: aString
	^ self fromSimplification: (NeoJSONReader fromString: aString)