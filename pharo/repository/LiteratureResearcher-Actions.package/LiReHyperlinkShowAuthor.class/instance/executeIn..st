target resize
executeIn: aController
	id = referencingId
		ifTrue: [ | node |
			node := (aController graph nodesOfClass: LiReAuthor) detect: [ :n | n name = id ].
			aController selectNode: node ]
		ifFalse: [ | edge |
			edge := (aController graph edgesOfClass: LiReHasWritten) detect: [ :e | e key = id and: [ e target bibtex key = referencingId ] ].
			aController selectEdge: edge ]