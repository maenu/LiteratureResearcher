as yet unclassified
loadFromUrl: anArticle
	[ ^ pdfscrap processBibtex: anArticle bibtex ]
		on: LiRePdfscrapProcessError
		do: [ :e | 
			self flag: 'log?'.
			^ nil ]