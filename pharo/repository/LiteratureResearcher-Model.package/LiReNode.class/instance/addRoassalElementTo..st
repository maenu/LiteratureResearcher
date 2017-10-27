adding
addRoassalElementTo: aView
	| element |
	element := self asRoassalElement.
	aView add: element.
	element
		@ RTDraggable;
		@ LiReRTHighlightable;
		@ LiReRTSelectable;
		@ LiReRTSelectableElementContextInteraction.
	self
		whenPropertyChangedDo: [ element update.
			aView signalUpdate ]