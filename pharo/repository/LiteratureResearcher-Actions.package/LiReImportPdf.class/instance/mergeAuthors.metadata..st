as yet unclassified
mergeAuthors: anArticle metadata: metadata
	| graph authors affiliations existingEdges missingAuthors |
	graph := anArticle graph.
	authors := metadata authors.
	affiliations := metadata affiliations.
	authors do: [ :a | affiliations detect: [ :aff | (aff at: #id) = (a at: #xrefAffRid) ] ifFound: [ :aff | a addAll: aff ] ].
	existingEdges := anArticle incomingEdgesOfClass: LiReHasWritten.
	missingAuthors := (authors withIndexCollect: [ :e :i | i -> e ])
		reject: [ :r | 
			existingEdges
				contains: [ :e | 
					e target bibtex key = anArticle bibtex key
						ifTrue: [ e mergeMetadata: r.
							true ]
						ifFalse: [ false ] ] ].
	missingAuthors
		do: [ :r | 
			| key node edge |
			key := r value at: #stringName.
			node := (graph nodesOfClass: LiReAuthor)
				detect: [ :n | n matches: key ]
				ifNone: [ | newNode |
					newNode := LiReAuthor graph: graph name: key.
					graph nodes add: newNode ].
			edge := LiReHasWritten
				graph: graph
				source: node
				target: anArticle
				metadata: r.
			graph edges add: edge ]