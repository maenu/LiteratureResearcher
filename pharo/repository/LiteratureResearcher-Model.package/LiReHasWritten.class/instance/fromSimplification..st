instance creation
fromSimplification: aSimplification
	super fromSimplification: aSimplification.
	email := aSimplification at: #email.
	institution := aSimplification at: #institution.
	country := aSimplification at: #country