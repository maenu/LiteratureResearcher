as yet unclassified
mergeReferences: anArticle bibtex: aBibtexList metadata: aMetadata
	| graph references existingEdges missingReferences |
	self assert: aBibtexList entries size = aMetadata references size.
	graph := anArticle graph.
	references := (1 to: aBibtexList entries size) collect: [ :i | (aBibtexList entries at: i) -> (aMetadata references at: i) ].
	existingEdges := anArticle incomingEdgesOfClass: LiReHasWritten.
	missingReferences := references reject: [ :r | existingEdges contains: [ :e | e matches: r key key ] ].
	missingReferences
		do: [ :r | 
			| key node edge |
			key := r value at: #key.
			node := (graph nodesOfClass: LiReArticle)
				detect: [ :n | n matches: key ]
				ifNone: [ | newNode |
					newNode := LiReArticle graph: graph bibtex: r key metadata: aMetadata document.
					graph nodes add: newNode ].
			edge := LiReReferences
				graph: graph
				source: anArticle
				target: node
				key: key
				bibtex: r key
				text: (r value at: #text).
			graph edges add: edge ]