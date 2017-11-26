instance creation
block: aBlock
	^ self basicNew
		initialize;
		block: aBlock;
		yourself