as yet unclassified
findCitations: anId
	| result |
	result := subprocess
		execute:
			{'--csv'.
			'--no-citations'.	"a bit confusing, but this field is not needed"
			'--citations-only'.
			'--cluster-id'.
			(LiReSubprocess escape: anId)}
		wait: 30 seconds.
	^ self parseCsv: result out