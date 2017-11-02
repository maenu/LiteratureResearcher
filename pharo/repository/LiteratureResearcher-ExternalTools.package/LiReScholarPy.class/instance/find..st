typing/selecting keys
find: aString
	| result |
	result := subprocess
		execute:
			{'--csv'.
			'--no-citations'.
			'--all'.
			(LiReSubprocess escape: aString)}
		wait: 30 seconds.
	^ self parseCsv: result out