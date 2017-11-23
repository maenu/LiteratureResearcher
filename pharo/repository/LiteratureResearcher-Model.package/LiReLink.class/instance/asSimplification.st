converting
asSimplification
	| dictionary |
	dictionary := super asSimplification.
	dictionary at: #key put: key.
	id ifNotNil: [ dictionary at: #id put: id ].
	text ifNotNil: [ dictionary at: #text put: text ].
	page ifNotNil: [ dictionary at: #page put: page ].
	rectangle
		ifNotNil: [ dictionary
				at: #rectangle
				put:
					{rectangle left.
					rectangle top.
					rectangle width.
					rectangle height} ].
	color ifNotNil: [ dictionary at: #color put: (color rgbTriplet * 255 collect: #asInteger) ].
	^ dictionary