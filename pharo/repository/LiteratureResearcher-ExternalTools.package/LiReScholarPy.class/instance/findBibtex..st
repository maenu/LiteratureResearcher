execution
findBibtex: anId
	| arguments result |
	arguments := self newDefaultArguments.
	arguments
		addAll:
			{'--citation'.
			'bt'.
			'--count'.
			'1'.
			'--cluster-id'.
			(LiReSubprocess escape: anId)}.
	result := subprocess execute: arguments wait: 30 seconds.
	^ LiReBibParser parse: result out