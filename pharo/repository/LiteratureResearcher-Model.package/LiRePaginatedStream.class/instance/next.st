filter streaming
next
	self assert: [ self atEnd not ].
	"needs to peek at the next page, as it might be the last one"
	position + 2 <= cache size
		ifFalse: [ self loadNextPage ].
	position := position + 1.
	^ cache at: position