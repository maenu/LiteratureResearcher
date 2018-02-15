execution
executeWithId: aString referencingId: anotherString
	aString = anotherString
		ifTrue: [ | node |
			node := (controller graph nodesOfClass: LiReAuthor) detect: [ :n | n name = aString ].
			controller selectNode: node ]
		ifFalse: [ | edge |
			edge := (controller graph edgesOfClass: LiReHasWritten) detect: [ :e | e key = aString and: [ e target bibtex key = anotherString ] ].
			controller selectEdge: edge ]