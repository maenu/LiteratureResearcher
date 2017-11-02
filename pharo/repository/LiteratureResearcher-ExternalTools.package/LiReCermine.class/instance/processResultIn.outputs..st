processing
processResultIn: aDirectory outputs: anOrderedCollection
	| result |
	result := (anOrderedCollection collect: [ :output | output -> (aDirectory / (Subject , '.' , output)) ]) asDictionary.
	(anOrderedCollection select: [ :output | (result includesKey: output) not ])
		ifNotEmpty: [ :missingOutputs | 
			LiReCermineProcessError
				signal: 'Not all outputs contained. Expected "' , (',' join: anOrderedCollection) , '", missing "' , (',' join: missingOutputs) , '"' ].
	^ result