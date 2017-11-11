filter streaming
contents
	[ self atEnd ] whileFalse: [ self loadNextPage ].
	^ cache