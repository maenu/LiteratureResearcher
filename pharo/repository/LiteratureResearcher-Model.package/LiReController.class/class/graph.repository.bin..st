accessing
graph: aGraph repository: aRelativePath bin: anotherFileReference
	^ self new
		graph: aGraph;
		repository: aRelativePath;
		bin: anotherFileReference;
		yourself