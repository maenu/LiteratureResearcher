adding
addRoassalElementTo: aView
	| element |
	element := self asRoassalElement.
	aView add: element.
	element @ RTDraggable.
	self
		whenPropertyChangedDo: [ element update.
			aView signalUpdate ]