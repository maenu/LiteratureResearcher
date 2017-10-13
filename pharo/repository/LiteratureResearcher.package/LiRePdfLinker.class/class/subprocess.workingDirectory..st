accessing
subprocess: aSubprocess workingDirectory: aWorkingDirectory
	^ self new
		subprocess: aSubprocess;
		workingDirectory: aWorkingDirectory;
		yourself