instance creation
fromSimplification: aSimplification
	super fromSimplification: aSimplification.
	self bibtex: ((aSimplification at: #bibtex) ifNotNil: [ :s | (LiReBibParser parse: s) entries first ])