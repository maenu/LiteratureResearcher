tests
testFindCitations
	| out |
	out := scholarPy findCitations: clusterId start: 0 count: 10.
	self assert: out isNotEmpty