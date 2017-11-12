as yet unclassified
loadFromTitle: anArticle
	| rows rowWithUrl |
	self flag: 'search more than 10?'.
	rows := [ scholarPy findByTitle: (anArticle bibtex at: #title) value start: 0 count: 10 ]
		on: LiReScholarPyProcessError
		do: [ :e | 
			Transcript
				show: e;
				cr.
			^ nil ].
	rowWithUrl := rows detect: [ :r | (r at: #urlPdf) isNotNil or: [ (r at: #url) isNotNil ] ] ifNone: [ ^ nil ].
	anArticle mergeCsv: rowWithUrl.
	^ self loadFromUrl: anArticle