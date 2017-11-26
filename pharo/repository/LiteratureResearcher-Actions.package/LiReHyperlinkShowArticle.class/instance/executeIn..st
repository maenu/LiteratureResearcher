execution
executeIn: aController
	id = referencingId
		ifTrue: [ | node |
			node := (aController graph nodesOfClass: LiReArticle) detect: [ :n | n bibtex key = id ].
			aController selectNode: node ]
		ifFalse: [ | edge |
			edge := (aController graph edgesOfClass: LiReReferences ) detect: [ :e | e key = id and: [ e source bibtex key = referencingId ] ].
			aController selectEdge: edge ]