as yet unclassified
mergeAuthors: anArticle metadata: metadata
	| graph authors affiliations existingEdges missingAuthors |
	graph := anArticle graph.
	authors := metadata authors.
	affiliations := metadata affiliations.
	authors do: [ :a | affiliations detect: [ :aff | (aff at: #id) = (a at: #xrefAffRid) ] ifFound: [ :aff | a addAll: aff ] ].
	existingEdges := anArticle incomingEdgesOfClass: LiReHasWritten.
	missingAuthors := authors reject: [ :a | existingEdges contains: [ :e | e matches: (a at: #stringName) ] ].
	missingAuthors
		do: [ :a | 
			| key node edge |
			key := a at: #stringName.
			node := (graph nodesOfClass: LiReAuthor)
				detect: [ :n | n matches: key ]
				ifNone: [ | newNode |
					newNode := LiReAuthor graph: graph name: key.
					graph nodes add: newNode ].
			edge := LiReHasWritten
				graph: graph
				source: node
				target: anArticle
				key: key
				email: (a at: #email)
				institution: (a at: #institution)
				country: (a at: #country).
			graph edges add: edge ]