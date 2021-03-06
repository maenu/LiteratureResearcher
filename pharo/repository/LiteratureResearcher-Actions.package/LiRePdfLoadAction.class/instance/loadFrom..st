execution
loadFrom: anArticle
	((anArticle bibtex hasField: #url) and: [ (anArticle bibtex at: #url) rawValue isNotNil ])
		ifTrue: [ (self loadFromUrl: anArticle) ifNotNil: [ :pdf | ^ pdf ] ].
	((anArticle bibtex hasField: #title) and: [ (anArticle bibtex at: #title) rawValue isNotNil ])
		ifTrue: [ (self loadFromTitle: anArticle) ifNotNil: [ :pdf | ^ pdf ] ].
	(self loadFromDragNDrop: anArticle) ifNotNil: [ :pdf | ^ pdf ].
	^ nil