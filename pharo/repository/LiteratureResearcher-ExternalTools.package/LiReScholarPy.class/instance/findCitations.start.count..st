as yet unclassified
findCitations: anId start: anInteger count: anotherInteger
	| result |
	result := subprocess
		execute:
			{'--cookie-file'.
			(LiReSubprocess escape: cookie pathString).
			'--user-agent'.
			(LiReSubprocess escape: userAgent).
			'--csv'.
			'--no-citations'.	"a bit confusing, but this field is not needed"
			'--cites'.
			'--start'.
			(LiReSubprocess escape: anInteger asString).
			'--count'.
			(LiReSubprocess escape: anotherInteger asString).
			'--cluster-id'.
			(LiReSubprocess escape: anId)}
		wait: 30 seconds.
	^ self parseCsv: result out