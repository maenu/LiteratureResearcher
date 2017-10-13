accessing
subprocess: aSubprocess workingDirectory: aWorkingDirectory outputs: anOrderedCollection
	^ self new
		subprocess: aSubprocess;
		workingDirectory: aWorkingDirectory;
		outputs: anOrderedCollection;
		yourself