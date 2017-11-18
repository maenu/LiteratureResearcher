converting
asIcon
	^ labels
		ifEmpty: [ LiReLabel default asIcon ]
		ifNotEmpty: [ :c | 
			| container |
			container := (Morph newBounds: (0 @ 0 extent: 12 @ 12))
				color: Color transparent;
				yourself.
			c
				doWithIndex: [ :l :i | 
					| offset |
					offset := i - 1.
					container
						width: container width + (3 * offset);
						addMorph:
							(l asIcon
								bounds: ((3 * offset) @ offset extent: 12 @ 12);
								yourself) ].
			container ]