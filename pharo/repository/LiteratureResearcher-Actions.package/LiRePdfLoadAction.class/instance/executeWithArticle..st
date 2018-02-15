execution
executeWithArticle: anArticle
	(self loadFrom: anArticle) ifNil: [ LiReActionError signal: 'No PDF provided, abort action.' ] ifNotNil: [ :pdf | self movePdf: pdf toRepositoryFor: anArticle ]