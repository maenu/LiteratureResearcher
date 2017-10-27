as yet unclassified
loadFromTitle: anArticle
	| rows rowWithUrl |
	rows := [ scholarPy findByTitle: (anArticle bibtex at: #title) value ]
		on: LiReScholarPyProcessError
		do: [ :e | 
			self flag: 'log?'.
			^ nil ].
	rowWithUrl := rows detect: [ :r | (r at: #urlPdf) isNotNil or: [ (r at: #url) isNotNil ] ] ifNone: [ ^ nil ].
	anArticle bibtex at: #url put: (rowWithUrl at: #urlPdf ifAbsent: [ rowWithUrl at: #url ]).
	^ self loadFromUrl: anArticle