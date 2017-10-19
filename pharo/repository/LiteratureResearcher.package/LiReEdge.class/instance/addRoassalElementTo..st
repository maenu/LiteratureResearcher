converting
addRoassalElementTo: aView
	| element sourceElement targetElement |
	sourceElement := aView elements detect: [ :e | e model == source ].
	targetElement := aView elements detect: [ :e | e model == target ].
	element := RTEdge on: self from: sourceElement to: targetElement.
	element
		+
			(RTStyledMultiLine new
				arrowHead;
				withBorderAttachPoint;
				perform: self lineStyleSelector;
				yourself).
	aView add: element.
	self
		whenPropertyChangedDo: [ element update.
			aView signalUpdate ]