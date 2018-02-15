execution
executeWithId: aString referencingId: anotherString
	aString = anotherString
		ifTrue: [ | node |
			node := (controller graph nodesOfClass: LiReArticle) detect: [ :n | n bibtex key = aString ].
			controller selectNode: node ]
		ifFalse: [ | edge |
			edge := (controller graph edgesOfClass: LiReReferences) detect: [ :e | e key = aString and: [ e source bibtex key = anotherString ] ].
			controller selectEdge: edge ]