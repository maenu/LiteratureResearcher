actions
clickOn: anElement
	(self isSelected: anElement)
		ifTrue: [ self unselect: anElement ]
		ifFalse: [ self select: anElement ]