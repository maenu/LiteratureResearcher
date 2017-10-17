accessing
source: anObject
	self assert: (self class canBecomeSource: anObject).
	source := anObject