target resize
executeIn: anArticle
	(self loadFrom: anArticle) ifNil: [ LiReActionError signal: 'No PDF provided, abort action.' ] ifNotNil: [ :pdf | ^ self copyPdf: pdf toRepositoryFor: anArticle ]