as yet unclassified
findByTitle: aString start: anInteger count: anotherInteger
	| result |
	result := subprocess
		execute:
			{'--cookies-file'.
			(LiReSubprocess escape: cookies pathString).
			'--user-agent'.
			(LiReSubprocess escape: userAgent).
			'--csv'.
			'--no-citations'.
			'--title-only'.
			'--start'.
			(LiReSubprocess escape: anInteger asString).
			'--count'.
			(LiReSubprocess escape: anotherInteger asString).
			'--all'.
			(LiReSubprocess escape: aString)}
		wait: 30 seconds.
	^ self parseCsv: result out