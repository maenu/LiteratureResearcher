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
			subDirectory pathString.
			'-outputs'.
			(',' join: outputs).
			'-exts'.
			(',' join: outputs)}.
	^ self processResultIn: subDirectory