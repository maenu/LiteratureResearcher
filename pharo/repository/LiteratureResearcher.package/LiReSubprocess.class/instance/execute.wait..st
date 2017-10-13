running
execute: anOrderedCollection wait: aDuration
	| monitor process out err |
	process := PipeableOSProcess command: command , ' ' , (' ' join: anOrderedCollection).
	monitor := Monitor new.
	monitor critical: [ monitor waitUntil: [ process isComplete ] maxMilliseconds: aDuration asMilliSeconds ].
	process isComplete
		ifFalse: [ process close ].
	out := process upToEndOfFile.
	err := process errorUpToEndOfFile.
	process closePipes.
	process succeeded
		ifFalse: [ (LiReSubprocessError out: out err: err) signal ].
	^ LiReSubprocessSuccess out: out err: err