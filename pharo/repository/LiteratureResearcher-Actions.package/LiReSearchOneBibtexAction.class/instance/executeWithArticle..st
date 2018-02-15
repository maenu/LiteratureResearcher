execution
executeWithArticle: anArticle
	^ self newArticleWith: (scholarPy findBibtex: (anArticle bibtex at: #title) value)