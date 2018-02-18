adding
addNode: aNode
	aNode hidden
		ifFalse: [ aNode addRoassalEntityTo: view ].
	(aNode isKindOf: LiReArticle)
		ifTrue: [ aNode
				whenPropertyChangedDo: [ :a | 
					a property = #bibtex
						ifTrue: [ (a instance bibtex hasField: #pdf)
								ifTrue: [ graph announcer announce: (LiReRequestPdfMove article: a instance) ] ] ] ]