resolving
resolve: aBlock
	| result |
	[ then
		cull:
			([ result := aBlock value ]
				on: Error
				do: [ :e | result := except cull: e ]) ]
		ensure: finally.
	^ result