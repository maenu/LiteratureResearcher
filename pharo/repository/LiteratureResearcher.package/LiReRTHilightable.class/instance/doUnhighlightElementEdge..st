actions
doUnhighlightElementEdge: anElement
	self doUnhighlightElementNonRecursive: anElement.
	self doUnhighlightElementNonRecursive: anElement from.
	self doUnhighlightElementNonRecursive: anElement to