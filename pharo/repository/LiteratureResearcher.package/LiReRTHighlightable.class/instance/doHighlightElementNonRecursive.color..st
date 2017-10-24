actions
doHighlightElementNonRecursive: anElement color: aColor
	labelledInteraction removeLabelFrom: anElement.
	anElement @ labelledInteraction.
	self recordElement: anElement.
	anElement pushFront.
	(anElement attributes at: #RTLabelledLabel) pushFront.
	(self isSelected: anElement)
		ifFalse: [ anElement trachelShape allColor: aColor ].
	anElement view ifNotNil: [ anElement view signalUpdate ]