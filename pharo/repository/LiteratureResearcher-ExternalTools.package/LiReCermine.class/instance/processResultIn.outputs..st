processing
processResultIn: aDirectory outputs: anOrderedCollection
	| result |
	result := (anOrderedCollection
		collect: [ :output | output -> (aDirectory / (Subject , '.' , output)) ])
		asDictionary.
	(anOrderedCollection reject: [ :output | result includesKey: output ])
		ifNotEmpty: [ :missingOutputs | 
			LiReCermineProcessError
				signal:
					'Not all outputs contained. Expected "'
						, (',' join: anOrderedCollection) , '", missing "'
						, (',' join: missingOutputs) , '"' ].
	^ result