as yet unclassified
findClusterId: aString
	| result |
	result := self findByTitle: aString.
	result size = 1
		ifFalse: [ LiReScholarPyProcessError signal: 'Non-unique result, cannot extract clusterId.' ].
	^ (result at: 1) at: #clusterId