adding
addRoassalElementTo: aView
	| element menu |
	element := self asRoassalElement.
	aView add: element.
	menu := self gtInspectorActions inject: RTMenuActivable new into: [ :m :a | m item: a title action: [ :e | a action cull: nil ] ].
	element
		@ RTDraggable;
		@ LiReRTHighlightable;
		@ LiReRTSelectable;
		@ LiReRTSelectableElementContextInteraction;
		@ menu.
	self
		whenPropertyChangedDo: [ element update.
			aView signalUpdate ]