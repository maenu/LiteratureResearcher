execution
findByAuthors: aCollection start: anInteger count: anotherInteger
	| arguments result |
	arguments := self newDefaultArguments.
	arguments
		addAll:
			{'--csv'.
			'--no-citations'.
			'--title-only'.
			'--start'.
			(LiReSubprocess escape: anInteger asString).
			'--count'.
			(LiReSubprocess escape: anotherInteger asString).
			'--author'.
			(LiReSubprocess escape: (', ' join: aCollection))}.
	result := subprocess execute: arguments wait: 30 seconds.
	^ self parseCsv: result out