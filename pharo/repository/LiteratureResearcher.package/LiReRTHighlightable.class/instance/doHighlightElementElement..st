actions
doHighlightElementElement: anElement
	self doHighlightElementNonRecursive: anElement color: color.
	anElement connectedEdges
		do: [ :e | 
			e from == anElement
				ifTrue: [ self doHighlightElementNonRecursive: e color: toColor.
					self doHighlightElementNonRecursive: e to color: toColor ]
				ifFalse: [ self doHighlightElementNonRecursive: e color: fromColor.
					self doHighlightElementNonRecursive: e from color: fromColor ] ]