as yet unclassified
mergeReferences: anArticle bibtex: aBibtexList metadata: aMetadata
	| graph references existingEdges missingReferences |
	self assert: aBibtexList entries size = aMetadata references size.
	graph := anArticle graph.
	references := (1 to: aBibtexList entries size) collect: [ :i | (aBibtexList entries at: i) -> (aMetadata references entries at: i) ].
	existingEdges := anArticle incomingEdgesOfClass: LiReHasWritten.
	missingReferences := references reject: [ :r | existingEdges contains: [ :e | e matches: r key key ] ].
	missingReferences
		do: [ :r | 
			| key node edge |
			key := r key key.
			node := (graph nodesOfClass: LiReArticle)
				detect: [ :n | n matches: key ]
				ifNone: [ | newNode |
					newNode := LiReArticle graph: graph bibtex: r key metadata: aMetadata document.
					graph nodes add: newNode ].
			edge := LiReHasWritten
				graph: graph
				source: anArticle
				target: node
				key: key
				bibtex: r key
				text: r value.
			graph edges add: edge ]