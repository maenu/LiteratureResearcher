typing/selecting keys
find: aString start: anInteger count: anotherInteger
	| result |
	result := subprocess
		execute:
			{'--cookie-file'.
			(LiReSubprocess escape: cookie pathString).
			'--user-agent'.
			(LiReSubprocess escape: userAgent).
			'--csv'.
			'--no-citations'.
			'--start'.
			(LiReSubprocess escape: anInteger asString).
			'--count'.
			(LiReSubprocess escape: anotherInteger asString).
			'--all'.
			(LiReSubprocess escape: aString)}
		wait: 30 seconds.
	^ self parseCsv: result out