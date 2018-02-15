converting
fromSimplification: aSimplification
	super fromSimplification: aSimplification.
	self bibtex: ((aSimplification at: #bibtex) ifNotNil: [ :s | (LiReBibParser parse: s) entries first ]).
	self titleLink: ((aSimplification at: #titleLink) ifNotNil: [ :d | LiReLink fromSimplification: d ])