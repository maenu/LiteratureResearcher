converting
fromSimplification: aSimplification
	| dictionary |
	dictionary := super asSimplification.
	key := aSimplification at: #key.
	aSimplification at: #id ifPresent: [ :v | id := v ].
	aSimplification at: #text ifPresent: [ :v | text := v ].
	aSimplification at: #page ifPresent: [ :v | page := v ].
	aSimplification at: #rectangle ifPresent: [ :v | rectangle := Rectangle origin: (v at: 1) @ (v at: 2) extent: (v at: 3) @ (v at: 4) ].
	aSimplification at: #color ifPresent: [ :v | color := Color r: (v at: 1) / 255 g: (v at: 2) / 255 b: (v at: 3) / 255 ].
	^ dictionary