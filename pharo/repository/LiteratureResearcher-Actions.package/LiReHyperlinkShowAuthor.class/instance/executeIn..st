target resize
executeIn: aController
	id = referencingId
		ifTrue: [ | node |
			node := aController graph nodes detect: [ :n | (n isKindOf: LiReAuthor) and: [ n name = id ] ].
			aController selectNode: node ]
		ifFalse: [ | edge |
			edge := aController graph edges detect: [ :e | (e isKindOf: LiReHasWritten) and: [ e key = id and: [ e target bibtex key = referencingId ] ] ].
			aController selectEdge: edge ]
