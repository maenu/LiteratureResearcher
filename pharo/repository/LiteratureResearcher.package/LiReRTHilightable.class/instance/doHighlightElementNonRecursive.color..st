actions
doHighlightElementNonRecursive: anElement color: aColor
	labelledInteraction removeLabelFrom: anElement.
	anElement @ labelledInteraction.
	self recordElement: anElement.
	anElement trachelShape color: aColor.
	anElement pushFront.
	(anElement attributes at: #RTLabelledLabel) pushFront.
	anElement view ifNotNil: [ anElement view signalUpdate ]