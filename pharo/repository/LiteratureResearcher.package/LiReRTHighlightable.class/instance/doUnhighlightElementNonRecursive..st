actions
doUnhighlightElementNonRecursive: anElement
	labelledInteraction removeLabelFrom: anElement.
	((anElement hasAttribute: #originalColor) not or: [ self isSelected: anElement ])
		ifTrue: [ ^ self ].
	anElement trachelShape allColor: (anElement removeAttributeAt: #originalColor).
	anElement view signalUpdate