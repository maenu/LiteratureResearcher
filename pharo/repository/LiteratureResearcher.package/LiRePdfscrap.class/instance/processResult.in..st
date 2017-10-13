public
processResult: anId in: aDirectory
	| result |
	result := aDirectory / 'SUCCESS' / ('1_' , anId , '.pdf').
	result exists
		ifTrue: [ ^ result ].
	LiRePdfscrapProcessError signal: 'Could not find "' , result pathString , '"'