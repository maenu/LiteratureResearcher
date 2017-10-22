as yet unclassified
loadFromTitle: anArticle
	| rows rowWithUrlPdf |
	rows := [ scholarPy findByTitle: (anArticle bibtex at: #title) value ]
		on: LiReScholarPyProcessError
		do: [ :e | 
			self flag: 'log?'.
			^ nil ].
	rowWithUrlPdf := rows detect: [ :r | (r at: #urlPdf) isNotNil ] ifNone: [ ^ nil ].
	anArticle bibtex at: #url put: (rowWithUrlPdf at: #urlPdf).
	^ self loadFromUrl: anArticle