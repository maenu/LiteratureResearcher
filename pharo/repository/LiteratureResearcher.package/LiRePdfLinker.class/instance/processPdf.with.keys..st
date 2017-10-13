as yet unclassified
processPdf: anId with: aFileReference keys: anOrderedCollection
	| result |
	result := workingDirectory directory / (anId , '.pdf').
	result exists
		ifTrue: [ ^ result ].
	subprocess
		execute:
			{anId.
			aFileReference pathString.
			result pathString.
			(String streamContents: [ :stream | (NeoCSVWriter on: stream) nextPutAll: anOrderedCollection ])}.
	result exists
		ifTrue: [ ^ result ].
	LiRePdfLinkerProcessError signal: 'Expected "' , result pathString , '" to exist, but it does not'