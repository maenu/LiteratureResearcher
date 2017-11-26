execution
findClusterId: aString
	| result |
	result := self findByTitle: aString start: 0 count: 1.
	result size = 1
		ifFalse: [ LiReScholarPyProcessError signal: 'Non-unique result, cannot extract clusterId.' ].
	^ (result at: 1) at: #clusterId