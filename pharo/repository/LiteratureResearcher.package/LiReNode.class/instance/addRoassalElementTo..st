adding
addRoassalElementTo: aView
	| element |
	element := self asRoassalElement.
	aView add: element.
	element @ RTDraggable.
	element
		@
			(RTLabeled new
				text: self label;
				yourself)