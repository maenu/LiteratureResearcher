doits
make
	| controllerClass pipeableOSProcessClass process out err delay |
	controllerClass := Smalltalk at: #LiReController ifAbsent: [ self signal: 'Could not find LiReController, loading failed.' ].
	pipeableOSProcessClass := Smalltalk
		at: #PipeableOSProcess
		ifAbsent: [ self signal: 'Could not find PipeableOSProcess, loading failed.' ].
	process := pipeableOSProcessClass command: 'cd ''' , controllerClass cachedGithubRepository , ''' && make'.
	[ out := process upToEndOfFile ] fork.
	[ err := process errorUpToEndOfFile ] fork.
	delay := Delay forMilliseconds: 50.
	[ process isComplete ] whileFalse: [ delay wait ].
	process succeeded
		ifFalse: [ Transcript
				show: 'LiteratureResearcher log';
				cr;
				show: 'stdout: ' , out;
				cr;
				show: 'stderr: ' , err;
				cr.
			self signal: 'Make of LiteratureResearcher failed, see transcript for logs' ]