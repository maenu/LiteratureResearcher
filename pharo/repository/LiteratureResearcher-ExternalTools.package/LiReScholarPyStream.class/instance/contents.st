filter streaming
contents
	[ complete ] whileFalse: [ self loadNextPage ].
	^ cache