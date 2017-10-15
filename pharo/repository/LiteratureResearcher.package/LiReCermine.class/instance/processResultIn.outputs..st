processing
processResultIn: aDirectory outputs: anOrderedCollection
	| result |
	result := (anOrderedCollection collect: [ :output | output -> (aDirectory / (Subject , '.' , output)) ]) asDictionary.
	(anOrderedCollection select: [ :output | (result includesKey: output) not ])
		ifNotEmpty: [ :missingOutputs | 
			LiReCermineProcessError
				signal: 'Not all outputs contained. Expected "' , (',' join: anOrderedCollection) , '", missing "' , (',' join: missingOutputs) , '"' ].
	(result associations select: [ :association | association value exists not ])
		ifNotEmpty: [ :missingAssociations | 
			LiReCermineProcessError
				signal:
					'Not all outputs exist. Expected files ending with all of "' , (',' join: anOrderedCollection) , '", missing "'
						, (',' join: missingAssociations asDictionary values) , '"' ].
	^ result