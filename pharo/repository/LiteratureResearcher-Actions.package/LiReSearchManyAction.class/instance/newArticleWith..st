execution
newArticleWith: aDictionary
	^ LiReArticle graph: nil bibtex: (self newBibtexWith: aDictionary)