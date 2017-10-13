as yet unclassified
findByTitle: aString
	| result |
	result := subprocess
		execute:
			{'--csv-header'.
			'--no-citations'.
			'--title-only'.
			'--all'.
			aString}.
	^ (self readCsv: result out) at: 1 ifAbsent: [ LiReScholarPyProcessError signal: 'No entry found' ]