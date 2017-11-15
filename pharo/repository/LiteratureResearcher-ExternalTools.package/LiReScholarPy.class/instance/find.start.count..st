typing/selecting keys
find: aString start: anInteger count: anotherInteger
	| arguments result |
	arguments := self newDefaultArguments.
	arguments
		addAll:
			{'--csv'.
			'--no-citations'.
			'--start'.
			(LiReSubprocess escape: anInteger asString).
			'--count'.
			(LiReSubprocess escape: anotherInteger asString).
			'--all'.
			(LiReSubprocess escape: aString)}.
	result := subprocess execute: arguments wait: 30 seconds.
	^ self parseCsv: result out