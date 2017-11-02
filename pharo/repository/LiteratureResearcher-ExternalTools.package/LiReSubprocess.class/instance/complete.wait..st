as yet unclassified
complete: aProcess wait: aDuration
	| delay timeout |
	delay := Delay forMilliseconds: 50.
	timeout := [ aDuration asDelay wait.
	aProcess isComplete
		ifFalse: [ aProcess
				close;
				closePipes ] ] fork.
	[ aProcess isComplete ] whileFalse: [ delay wait ].
	timeout isTerminated
		ifFalse: [ timeout terminate ]