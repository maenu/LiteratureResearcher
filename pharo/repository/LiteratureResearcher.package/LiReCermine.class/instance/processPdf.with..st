processing
processPdf: anId with: aFileReference
	| subDirectory |
	subDirectory := workingDirectory directory / anId.
	subDirectory exists
		ifTrue: [ ^ self processResultIn: subDirectory ].
	subDirectory := workingDirectory ensureSubDirectoryNamed: anId.
	aFileReference copyTo: subDirectory / (Subject , '.pdf').
	subprocess
		execute:
			{'pl.edu.icm.cermine.ContentExtractor'.
			'-path'.
			(LiReSubprocess escape: subDirectory pathString).
			'-outputs'.
			(LiReSubprocess escape: (',' join: outputs)).
			'-exts'.
			(LiReSubprocess escape: (',' join: outputs))}
		wait: 10 seconds.
	^ self processResultIn: subDirectory