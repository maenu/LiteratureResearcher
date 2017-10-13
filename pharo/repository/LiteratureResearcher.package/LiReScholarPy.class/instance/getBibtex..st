as yet unclassified
getBibtex: anId
	| result |
	result := subprocess
		execute:
			{'--citation'.
			'bt'.
			'--cluster-id'.
			(LiReSubprocess escape: anId)}
		wait: 30 seconds.
	^ CZBibParser parse: result out