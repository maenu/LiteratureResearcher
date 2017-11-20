processing
processPdf: anId with: aFileReference outputs: anOrderedCollection
	| directory |
	directory := FileReference newTempFilePrefix: 'LiReCermine' suffix: ''.
	directory ensureCreateDirectory.
	aFileReference copyTo: directory / (Subject , '.pdf').
	subprocess
		execute:
			{'pl.edu.icm.cermine.ContentExtractor'.
			'-path'.
			(LiReSubprocess escape: directory pathString).
			'-outputs'.
			(LiReSubprocess escape: (',' join: anOrderedCollection)).
			'-exts'.
			(LiReSubprocess escape: (',' join: anOrderedCollection))}
		wait: 30 seconds.
	^ self processResultIn: directory outputs: anOrderedCollection