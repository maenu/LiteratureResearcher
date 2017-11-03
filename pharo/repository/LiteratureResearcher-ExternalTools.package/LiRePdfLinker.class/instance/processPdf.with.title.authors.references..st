as yet unclassified
processPdf: anId with: aFileReference title: anOrderedCollection authors: anotherOrderedCollection references: yetAnotherOrderedCollection
	| result |
	result := FileReference newTempFilePrefix: 'LiRePdfLinker' suffix: '.pdf'.
	subprocess
		execute:
			{'--id'.
			(LiReSubprocess escape: anId).
			'--input'.
			(LiReSubprocess escape: aFileReference pathString).
			'--output'.
			(LiReSubprocess escape: result pathString).
			'--title'.
			(LiReSubprocess escape: (String streamContents: [ :stream | (NeoJSONWriter on: stream) nextPut: anOrderedCollection ])).
			'--authors'.
			(LiReSubprocess escape: (String streamContents: [ :stream | (NeoJSONWriter on: stream) nextPut: anotherOrderedCollection ])).
			'--references'.
			(LiReSubprocess escape: (String streamContents: [ :stream | (NeoJSONWriter on: stream) nextPut: yetAnotherOrderedCollection ]))}
		wait: 30 seconds.
	result exists
		ifFalse: [ LiRePdfLinkerProcessError signal: 'Expected "' , result pathString , '" to exist, but it does not' ].
	^ result