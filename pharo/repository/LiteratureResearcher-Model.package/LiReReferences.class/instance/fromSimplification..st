converting
fromSimplification: aSimplification
	super fromSimplification: aSimplification.
	bibtex := (aSimplification at: #bibtex) ifNotNil: [ :s | (LiReBibParser parse: s) entries first ].
	text := aSimplification at: #text