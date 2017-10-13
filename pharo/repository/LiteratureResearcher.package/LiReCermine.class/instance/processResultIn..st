processing
processResultIn: aDirectory
	| result |
	result := (outputs collect: [ :output | output -> (aDirectory / (Subject , '.' , output)) ]) asDictionary.
	(outputs select: [ :output | (result includesKey: output) not ])
		ifNotEmpty:
			[ :missingOutputs | LiReCermineProcessError signal: 'Not all outputs contained. Expected "' , (',' join: outputs) , '", missing "' , (',' join: missingOutputs) , '"' ].
	(result associations select: [ :association | association value exists not ])
		ifNotEmpty: [ :missingAssociations | 
			LiReCermineProcessError
				signal:
					'Not all outputs exist. Expected files ending with all of "' , (',' join: outputs) , '", missing "'
						, (',' join: missingAssociations asDictionary values) , '"' ].
	^ result