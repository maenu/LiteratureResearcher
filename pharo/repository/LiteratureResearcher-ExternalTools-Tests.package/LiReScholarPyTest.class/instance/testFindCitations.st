tests
testFindCitations
	| out |
	out := scholarPy findCitations: clusterId.
	self assert: out isNotEmpty