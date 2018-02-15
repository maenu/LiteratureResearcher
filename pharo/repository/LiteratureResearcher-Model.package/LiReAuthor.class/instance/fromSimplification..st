converting
fromSimplification: aSimplification
	super fromSimplification: aSimplification.
	self name: (aSimplification at: #name)