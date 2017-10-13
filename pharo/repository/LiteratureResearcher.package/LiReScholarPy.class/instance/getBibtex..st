as yet unclassified
getBibtex: anId
	| result |
	result := subprocess
		execute:
			{'--citation'.
			'bt'.
			'--cluster-id'.
			anId}.
	"no parsing yet"
	^ ((Character lf asString , Character lf asString split: result out) at: 1 ifAbsent: [ LiReScholarPyProcessError signal: 'No entry found' ]) trimmed