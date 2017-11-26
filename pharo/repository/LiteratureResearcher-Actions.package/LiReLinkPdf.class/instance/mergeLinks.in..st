as yet unclassified
mergeLinks: aDictionary in: anArticle
	| existingHasWritten existingReferences |
	aDictionary at: #title ifPresent: [ :l | anArticle titleLink: l ].
	existingHasWritten := anArticle incomingEdgesOfClass: LiReHasWritten.
	(aDictionary at: #authors)
		do: [ :l | 
			| edge |
			edge := existingHasWritten
				detect: [ :e | e matches: l key ]
				ifNone: [ | node |
					node := (anArticle graph nodesOfClass: LiReAuthor) detect: [ :n | n matches: l key ] ifNone: [ anArticle graph nodes add: (LiReAuthor graph: anArticle graph name: l text) ].
					anArticle graph edges
						add:
							(LiReHasWritten
								graph: anArticle graph
								source: node
								target: anArticle
								key: l key
								order: -1
								email: nil
								institution: nil
								country: nil) ].
			edge link: l ].
	existingReferences := anArticle outgoingEdgesOfClass: LiReReferences.
	(aDictionary at: #references)
		do: [ :l | 
			| text edge |
			text := l text ifNotNil: [ :s | (s copyWithRegex: '\s+' matchesReplacedWith: ' ') copyReplaceAll: '- ' with: '' ].
			edge := existingReferences
				detect: [ :e | e matches: l key ]
				ifNone: [ | node |
					node := (anArticle graph nodesOfClass: LiReArticle)
						detect: [ :n | n key isNotEmpty and: [ [ text isNotNil ] and: [ ((n key asLowercase levenshteinDistanceTo: text asLowercase) - (n key size - text size) abs) / (n key size min: text size) < 0.1 ] ] ]
						ifNone: [ | bibtex |
							bibtex := CZEntry type: CZEntry article.
							bibtex key: 'GENERATED'.
							bibtex at: #title put: text.
							anArticle graph nodes
								add:
									(LiReArticle
										graph: anArticle graph
										bibtex: bibtex
										csv: Dictionary new
										document: nil) ].
					anArticle graph edges
						add:
							(LiReReferences
								graph: anArticle graph
								source: anArticle
								target: node
								key: l key
								order: -1
								bibtex: nil
								text: l text) ].
			edge link: l ]