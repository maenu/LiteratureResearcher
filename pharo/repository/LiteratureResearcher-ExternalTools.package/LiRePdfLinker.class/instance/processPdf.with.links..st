as yet unclassified
processPdf: anId with: aFileReference links: aSimplification
	| output result |
	output := FileReference newTempFilePrefix: 'LiRePdfLinker' suffix: '.pdf'.
	result := subprocess
		execute:
			{'--input'.
			(LiReSubprocess escape: aFileReference pathString).
			'--output'.
			(LiReSubprocess escape: output pathString).
			'--links'.
			(LiReSubprocess escape: (NeoJSONWriter toString: aSimplification))}
		wait: 30 seconds.
	output exists
		ifFalse: [ LiRePdfLinkerProcessError signal: 'Expected "' , output pathString , '" to exist, but it does not' ].
	^ {(#output -> output).
	(#links -> (NeoJSONReader fromString: result out))} asDictionary