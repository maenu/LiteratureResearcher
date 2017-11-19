instance creation
fromSimplification: aSimplification
	^ (self name: (aSimplification at: #name))
		fromSimplification: aSimplification;
		yourself