execution
findCitations: anId start: anInteger count: anotherInteger
	| arguments result |
	arguments := self newDefaultArguments.
	arguments
		addAll:
			{'--csv'.
			'--no-citations'.	"a bit confusing, but this field is not needed"
			'--cites'.
			'--start'.
			(LiReSubprocess escape: anInteger asString).
			'--count'.
			(LiReSubprocess escape: anotherInteger asString).
			'--cluster-id'.
			(LiReSubprocess escape: anId)}.
	result := subprocess execute: arguments wait: 30 seconds.
	^ self parseCsv: result out