running
execute: anOrderedCollection wait: aDuration
	| process out err |
	process := PipeableOSProcess command: command , ' ' , (' ' join: anOrderedCollection).
	[ err := process errorUpToEndOfFile ] fork.
	[ out := process upToEndOfFile ] fork.
	self complete: process wait: aDuration.
	process succeeded
		ifFalse: [ (LiReSubprocessError out: out err: err) signal ].
	^ LiReSubprocessSuccess out: out err: err