instance creation
fromSimplification: aSimplification
	super fromSimplification: aSimplification.
	self email: (aSimplification at: #email).
	self institution: (aSimplification at: #institution).
	self country: (aSimplification at: #country)