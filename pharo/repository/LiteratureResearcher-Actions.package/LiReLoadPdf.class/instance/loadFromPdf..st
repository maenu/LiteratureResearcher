as yet unclassified
loadFromPdf: anArticle
	^ (anArticle bibtex at: #pdf) value asFileReference