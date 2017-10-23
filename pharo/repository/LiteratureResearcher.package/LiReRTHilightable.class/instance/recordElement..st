actions
recordElement: anElement
	(anElement attributes includesKey: #originalColor)
		ifTrue: [ ^ self ].
	anElement attributes at: #originalColor put: anElement trachelShape color