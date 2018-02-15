as yet unclassified
mergeReferences: anArticle bibtex: aBibtexList metadata: aMetadata
	| graph references existingReferences missingReferences |
	self assert: aBibtexList entries size = aMetadata references size.
	graph := anArticle graph.
	references := (1 to: aBibtexList entries size)
		collect: [ :i | self newReferenceAt: i withBibtex: (aBibtexList entries at: i) dictionary: (aMetadata references at: i) ].
	existingReferences := anArticle outgoingEdgesOfClass: LiReReferences.
	missingReferences := references
		reject: [ :r | 
			existingReferences
				anySatisfy: [ :e | 
					(e target matches: (r bibtex at: #title) value)
						ifTrue: [ e mergeWith: r.
							true ]
						ifFalse: [ false ] ] ].
	missingReferences
		do: [ :e | 
			| node |
			node := (graph nodesOfClass: LiReArticle)
				detect: [ :n | n matches: e key ]
				ifNone: [ | newNode |
					newNode := LiReArticle graph: graph bibtex: e bibtex.
					graph nodes add: newNode ].
			e
				graph: graph;
				source: anArticle;
				target: node.
			graph edges add: e ]