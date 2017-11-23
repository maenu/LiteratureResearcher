tests
testDiff
	| a b |
	a := #(1 2 #('y' 'x')).
	b := #(1 2 #('y' 'y')).
	self assert: a equals: b