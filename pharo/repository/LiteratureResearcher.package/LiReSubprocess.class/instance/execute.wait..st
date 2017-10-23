running
execute: anOrderedCollection wait: aDuration
	| process out err |
	process := PipeableOSProcess waitForCommand: command , ' ' , (' ' join: anOrderedCollection).
	self flag: 'https://pharo.fogbugz.com/f/cases/20544/Monitor-waitUntil-maxMilliseconds-does-not-respect-timeout'.
	"
	monitor := Monitor new.
	monitor critical: [ monitor waitUntil: [ process isComplete ] maxMilliseconds: aDuration asMilliSeconds ].
	process isComplete
		ifFalse: [ process close ].
	"
	out := process upToEndOfFile.
	err := process errorUpToEndOfFile.
	process closePipes.
	process succeeded
		ifFalse: [ (LiReSubprocessError out: out err: err) signal ].
	^ LiReSubprocessSuccess out: out err: err