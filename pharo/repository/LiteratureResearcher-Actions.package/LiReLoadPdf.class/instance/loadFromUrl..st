execution
loadFromUrl: anArticle
	| url |
	url := (anArticle bibtex at: #url) value.
	(url asUrl path endsWith: '.pdf')
		ifTrue: [ | file |
			file := FileReference newTempFilePrefix: 'LiReGet' suffix: '.pdf'.
			ZnClient new
				url: url;
				downloadTo: file.
			^ file ]
		ifFalse: [ [ ^ pdfdbscrap processBibtex: anArticle bibtex ]
				on: LiRePdfdbscrapProcessError
				do: [ :e | 
					Transcript
						show: e;
						cr.
					^ nil ] ]