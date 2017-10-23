actions
doHighlightElement: anElement
	anElement isEdge
		ifTrue: [ self doHighlightElementEdge: anElement ]
		ifFalse: [ self doHighlightElementElement: anElement ]