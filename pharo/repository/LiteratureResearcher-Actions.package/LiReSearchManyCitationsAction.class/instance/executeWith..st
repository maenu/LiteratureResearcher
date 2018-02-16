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
					e := LiReReferences
						graph: article graph
						source: a
						target: article
						key: ''
						order: -1
						bibtex: a bibtex copy.
					article graph edges add: e ] ].
	^ articles