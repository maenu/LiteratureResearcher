as yet unclassified
mergeReferences: anArticle bibtex: aBibtexList metadata: aMetadata
	| graph references existingEdges missingReferences |
	self assert: aBibtexList entries size = aMetadata references size.
	graph := anArticle graph.
	references := (1 to: aBibtexList entries size) collect: [ :i | i -> ((aBibtexList entries at: i) -> (aMetadata references at: i)) ].
	existingEdges := anArticle outgoingEdgesOfClass: LiReReferences.
	missingReferences := references
		reject: [ :r | 
			existingEdges
				contains: [ :e | 
					e target bibtex key = anArticle bibtex key
						ifTrue: [ e mergeMetadata: r.
							true ]
						ifFalse: [ false ] ] ].
	missingReferences
		do: [ :r | 
			| key node edge |
			key := r value value at: #key.
			node := (graph nodesOfClass: LiReArticle)
				detect: [ :n | n matches: key ]
				ifNone: [ | newNode |
					newNode := LiReArticle graph: graph bibtex: r value key document: aMetadata document.
					graph nodes add: newNode ].
			edge := LiReReferences
				graph: graph
				source: anArticle
				target: node
				metadata: r.
			graph edges add: edge ]