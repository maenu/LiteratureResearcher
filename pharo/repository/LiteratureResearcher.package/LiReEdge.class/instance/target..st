accessing
target: anObject
	self assert: (self class canBecomeTarget: anObject).
	target := anObject