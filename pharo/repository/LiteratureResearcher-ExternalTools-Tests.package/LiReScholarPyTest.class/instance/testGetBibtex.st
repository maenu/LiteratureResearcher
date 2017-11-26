tests
testGetBibtex
	| out |
	out := scholarPy findBibtex: clusterId.
	self assert: out isNotEmpty