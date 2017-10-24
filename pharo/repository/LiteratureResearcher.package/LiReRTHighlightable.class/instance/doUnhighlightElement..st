actions
doUnhighlightElement: anElement
	anElement isEdge
		ifTrue: [ self doUnhighlightElementEdge: anElement ]
		ifFalse: [ self doUnhighlightElementElement: anElement ]