as yet unclassified
findByAuthors: aCollection
	| result |
	result := subprocess
		execute:
			{'--csv-header'.
			'--no-citations'.
			'--title-only'.
			'--author'.
			(', ' join: aCollection)}.
	^ self readCsv: result out