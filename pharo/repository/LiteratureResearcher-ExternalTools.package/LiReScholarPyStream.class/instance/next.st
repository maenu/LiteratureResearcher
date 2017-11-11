accessing
next
	self assert: [ self atEnd not ].
	position + 1 <= cache size
		ifFalse: [ self loadNextPage ].
	self assert: [ self atEnd not ].
	position := position + 1.
	^ cache at: position