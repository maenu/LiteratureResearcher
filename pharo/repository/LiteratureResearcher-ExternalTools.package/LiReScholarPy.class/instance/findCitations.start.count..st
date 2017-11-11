as yet unclassified
findCitations: anId start: anInteger count: anotherInteger
	| result |
	result := subprocess
		execute:
			{'--cookies-file'.
			(LiReSubprocess escape: cookies pathString).
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