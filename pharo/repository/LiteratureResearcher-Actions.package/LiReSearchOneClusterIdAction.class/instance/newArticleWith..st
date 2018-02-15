instance creation
newArticleWith: aString
	^ LiReArticle
		graph: nil
		bibtex:
			((CZEntry type: CZEntry article)
				key: #GENERATED;
				at: #clusterid put: aString;
				yourself)