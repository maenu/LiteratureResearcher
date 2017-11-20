instance creation
fromFileReference: aFileReference
	^ aFileReference readStreamDo: [ :s | self fromSimplification: (NeoJSONReader on: s) next ]