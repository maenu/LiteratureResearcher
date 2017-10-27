converting
asRoassalElement
	^ (RTBox new
		size: 32;
		colorElement: [ :e | 
			(e hasAttribute: #originalColor)
				ifTrue: [ e attributeAt: #originalColor put: state color.
					e color ]
				ifFalse: [ state color ] ];
		yourself) elementOn: self