as yet unclassified
mergeHasWritten: anArticle metadata: aMetadata
	| graph hasWritten existingHasWritten missingHasWritten |
	graph := anArticle graph.
	hasWritten := aMetadata authors
		collectWithIndex: [ :d :i | 
			aMetadata affiliations detect: [ :a | (a at: #id) = (d at: #xrefAffRid) ] ifFound: [ :a | d addAll: a ].
			self newHasWrittenAt: i withDictionary: d ].
	existingHasWritten := anArticle incomingEdgesOfClass: LiReHasWritten.
	missingHasWritten := hasWritten
		reject: [ :h | 
			existingHasWritten
				anySatisfy: [ :e | 
					(e source matches: h key)
						ifTrue: [ e mergeWith: h.
							true ]
						ifFalse: [ false ] ] ].
	missingHasWritten
		do: [ :e | 
			| node |
			node := (graph nodesOfClass: LiReAuthor)
				detect: [ :n | n matches: e key ]
				ifNone: [ | newNode |
					newNode := LiReAuthor graph: graph name: e key.
					graph nodes add: newNode ].
			e
				graph: graph;
				source: node;
				target: anArticle.
			graph edges add: e ]