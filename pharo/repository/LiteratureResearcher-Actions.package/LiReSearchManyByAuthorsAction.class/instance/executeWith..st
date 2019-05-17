execution
executeWith: aCollection
	| authors articles |
	authors := aCollection at: 1.
	articles := super executeWith: aCollection.
	articles
		do: [ :a | 
			(a incomingEdgesOfClass: LiReHasWritten)
				detect: [ :e | authors includes: e source ]
				ifNone: [ | e |
					authors
						do: [ :b | 
							e := LiReHasWritten
								graph: b graph
								source: b
								target: a
								key: ''
								order: -1
								email: ''
								institution: ''
								country: ''.
							b graph edges add: e ] ] ].
	^ articles