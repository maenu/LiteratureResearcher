running
execute: anOrderedCollection
	| exitStatus out err |
	OSSUnixSubprocess new
		command: command;
		arguments: anOrderedCollection;
		redirectStdout;
		redirectStderr;
		runAndWaitOnExitDo: [ :process :out_ :err_ | 
			exitStatus := process exitStatusInterpreter.
			out := out_.
			err := err_ ].
	exitStatus isSuccess
		ifFalse: [ (LiReSubprocessError exitStatus: exitStatus out: out err: err) signal ].
	^ LiReSubprocessSuccess exitStatus: exitStatus out: out err: err