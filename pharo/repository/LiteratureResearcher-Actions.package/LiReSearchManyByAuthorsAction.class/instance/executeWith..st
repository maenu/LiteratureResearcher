execution
executeWith: aCollection
	| article articles |
	article := aCollection at: 1.
	articles := super executeWith: aCollection.
	articles
		do: [ :a | 
			(article incomingEdgesOfClass: LiReReferences)
				detect: [ :e | e source == a ]
				ifNone: [ | e |
					e := LiReHasWritten
						graph: article
						source: article
						target: a
						key: ''
						order: -1
						email: ''
						institution: ''
						country: ''.
					article graph edges add: e ] ].
	^ articles