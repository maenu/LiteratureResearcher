target resize
executeIn: aController
	id = referencingId
		ifTrue: [ | node |
			node := aController graph nodes detect: [ :n | (n isKindOf: LiReArticle) and: [ n bibtex key = id ] ].
			aController selectNode: node ]
		ifFalse: [ | edge |
			edge := aController graph edges detect: [ :e | (e isKindOf: LiReReferences) and: [ e key = id and: [ e source bibtex key = referencingId ] ] ].
			aController selectEdge: edge.
			"edge target announcer announce: (LiReRequestOpenWithAllOtherThingsNecessaryDoneBeforePdf article: edge target)" ]