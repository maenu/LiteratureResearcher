accessing
repositoryPdfOf: anArticle
	^ repository / (anArticle bibtex at: #pdf) value