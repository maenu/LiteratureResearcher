as yet unclassified
getBibtex: anId
	| result |
	result := subprocess
		execute:
			{'--cookie-file'.
			(LiReSubprocess escape: cookie pathString).
			'--user-agent'.
			(LiReSubprocess escape: userAgent).
			'--citation'.
			'bt'.
			'--count'.
			'1'.
			'--cluster-id'.
			(LiReSubprocess escape: anId)}
		wait: 30 seconds.
	^ LiReBibParser parse: result out