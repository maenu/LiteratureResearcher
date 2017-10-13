as yet unclassified
findCitations: anId
	| result |
	result := subprocess
		execute:
			{'--csv-header'.
			'--no-citations'.	"a bit confusing, but this field is not needed"
			'--citations-only'.
			'--cluster-id'.
			anId}.
	^ self readCsv: result out