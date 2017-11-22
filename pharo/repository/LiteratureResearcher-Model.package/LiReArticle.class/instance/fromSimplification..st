instance creation
fromSimplification: aSimplification
	super fromSimplification: aSimplification.
	bibtex := (aSimplification at: #bibtex) ifNotNil: [ :s | (LiReBibParser parse: s) entries first ].
	csv := aSimplification at: #csv.
	document := (aSimplification at: #document) ifNotNil: [ :s | XMLDOMParser parse: s ].
	titleLink := (aSimplification at: #titleLink) ifNotNil: [ :d | LiReLink fromSimplification: d ]