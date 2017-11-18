converting
asRoassalElement
	^ (RTEllipse new
		size: 32;
		colorElement: [ :e | 
			(e hasAttribute: #originalColor)
				ifTrue: [ e attributeAt: #originalColor put: self asColor.
					e color ]
				ifFalse: [ self asColor ] ];
		yourself) elementOn: self