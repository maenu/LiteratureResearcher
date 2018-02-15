execution
executeWithArticle: anArticle
	^ self newArticleWith: (scholarPy findClusterId: (anArticle bibtex at: #title) value)