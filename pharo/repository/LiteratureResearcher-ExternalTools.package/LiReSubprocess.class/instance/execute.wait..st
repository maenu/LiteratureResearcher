execution
execute: anOrderedCollection wait: aDuration
	| process out err |
	process := PipeableOSProcess command: command pathString , ' ' , (' ' join: anOrderedCollection).
	[ out := process upToEndOfFile ] fork.
	[ err := process errorUpToEndOfFile ] fork.
	self complete: process wait: aDuration.
	process succeeded
		ifFalse: [ (LiReSubprocessError out: out err: err) signal ].
	^ LiReSubprocessSuccess out: out err: err