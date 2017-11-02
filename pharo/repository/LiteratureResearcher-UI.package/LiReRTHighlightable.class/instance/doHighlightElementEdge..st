actions
doHighlightElementEdge: anElement
	self doHighlightElementNonRecursive: anElement color: color.
	self doHighlightElementNonRecursive: anElement from color: fromColor.
	self doHighlightElementNonRecursive: anElement to color: toColor