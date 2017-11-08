running
run: aString
	| pipeableOSProcessClass process out err delay |
	pipeableOSProcessClass := Smalltalk at: #PipeableOSProcess ifAbsent: [ Error signal: 'Could not find PipeableOSProcess, loading failed.' ].
	process := pipeableOSProcessClass command: aString.
	[ out := process upToEndOfFile ] fork.
	[ err := process errorUpToEndOfFile ] fork.
	delay := Delay forMilliseconds: 50.
	[ process isComplete ] whileFalse: [ delay wait ].
	process succeeded
		ifFalse: [ Transcript
				show: 'LiteratureResearcher run log';
				cr;
				show: 'stdout: ' , out;
				cr;
				show: 'stderr: ' , err;
				cr.
			Error signal: 'Run failed, see transcript for logs' ]