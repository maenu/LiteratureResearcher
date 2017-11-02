accessing
dropBlock: aBlock
	^ self basicNew
		dropBlock: aBlock;
		initialize;
		yourself