as yet unclassified
nextKeyCount: aCollection
	^ self renderKeyCount: (aCollection collect: [ :c | self parseKeyCount: c ]) sorted last + 1