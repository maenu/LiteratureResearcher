private
loadFrom: anArticle
Halt now.
	(anArticle bibtex hasField: #pdf)
		ifTrue: [ (self loadFromPdf: anArticle) ifNotNil: [ :pdf | ^ pdf ] ].
	(anArticle bibtex hasField: #url)
		ifTrue: [ (self loadFromUrl: anArticle) ifNotNil: [ :pdf | ^ pdf ] ].
	(anArticle bibtex hasField: #title)
		ifTrue: [ (self loadFromTitle: anArticle) ifNotNil: [ :pdf | ^ pdf ] ].
	(self loadFromDragNDrop: anArticle) ifNotNil: [ :pdf | ^ pdf ].
	^ nil