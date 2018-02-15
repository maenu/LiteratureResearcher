execution
loadFromTitle: anArticle
	self flag: 'search more than 10?'.
	^ (searchByTitle
		executeWith:
			{(anArticle bibtex at: #title) value.
			0.
			10})
		detect: [ :e | (e bibtex at: #url) value isNotNil ]
		ifFound: [ :e | 
			anArticle mergeWith: e.
			self loadFromUrl: anArticle ]
		ifNone: [ nil ]