as yet unclassified
colorFromCss: aString
	| r g b |
	r := (Integer readFrom: (aString copyFrom: 2 to: 3) base: 16) / 255.
	g := (Integer readFrom: (aString copyFrom: 4 to: 5) base: 16) / 255.
	b := (Integer readFrom: (aString copyFrom: 6 to: 7) base: 16) / 255.
	^ Color r: r g: g b: b