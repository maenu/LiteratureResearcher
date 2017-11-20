writing
writeToFile: aFileReference
	aFileReference writeStreamDo: [ :s | (NeoJSONWriter on: s) nextPut: self asSimplification ]