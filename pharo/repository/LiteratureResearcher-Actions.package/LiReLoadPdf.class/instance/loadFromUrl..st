as yet unclassified
loadFromUrl: anArticle
	[ ^ pdfdbscrap processBibtex: anArticle bibtex ]
		on: LiRePdfdbscrapProcessError
		do: [ :e | 
			Transcript
				show: e;
				cr.
			^ nil ]