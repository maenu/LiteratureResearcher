writing
writeToFile: aFileReference
	self flag: 'should not be here'.
	aFileReference writeStreamDo: [ :s | (NeoJSONWriter on: s) nextPut: self asSimplification ]