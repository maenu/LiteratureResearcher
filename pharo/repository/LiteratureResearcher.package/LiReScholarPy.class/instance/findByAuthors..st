as yet unclassified
findByAuthors: aCollection
	| result |
	result := subprocess
		execute:
			{'--csv'.
			'--no-citations'.
			'--title-only'.
			'--author'.
			(LiReSubprocess escape: (', ' join: aCollection))}
		wait: 30 seconds.
	^ self parseCsv: result out