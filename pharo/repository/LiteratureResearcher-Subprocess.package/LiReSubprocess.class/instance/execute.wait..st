running
execute: anOrderedCollection wait: aDuration
	| process out err |
	process := PipeableOSProcess command: command , ' ' , (' ' join: anOrderedCollection).
	[ process errorUpToEndOfFile ] fork.
	[ process upToEndOfFile ] fork.
	self flag: 'https://pharo.fogbugz.com/f/cases/20544/Monitor-waitUntil-maxMilliseconds-does-not-respect-timeout'.
	[ process isComplete ] whileFalse: [ (Delay forMilliseconds: 50) wait ].
	process succeeded
		ifFalse: [ (LiReSubprocessError out: out err: err) signal ].
	^ LiReSubprocessSuccess out: out err: err