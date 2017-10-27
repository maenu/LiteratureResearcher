as yet unclassified
findByTitle: aString
	| result |
	result := subprocess
		execute:
			{'--csv'.
			'--no-citations'.
			'--title-only'.
			'--all'.
			(LiReSubprocess escape: aString)}
		wait: 30 seconds.
	^ self parseCsv: result out