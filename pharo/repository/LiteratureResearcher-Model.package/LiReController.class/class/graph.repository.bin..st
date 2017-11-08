accessing
graph: aGraph repository: aFileReference bin: anotherFileReference
	aFileReference ensureCreateDirectory.
	^ self new
		graph: aGraph;
		repository: aFileReference;
		bin: anotherFileReference;
		yourself