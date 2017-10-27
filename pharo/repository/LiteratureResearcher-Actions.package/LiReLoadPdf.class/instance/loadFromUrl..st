as yet unclassified
loadFromUrl: anArticle
	[ ^ pdfscrap processBibtex: anArticle bibtex ]
		on: LiRePdfscrapProcessError
		do: [ :e | 
			Transcript
				show: e;
				cr.
			^ nil ]