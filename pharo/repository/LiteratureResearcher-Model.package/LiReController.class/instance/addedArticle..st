accessing
addedArticle: anArticle
	self normalizeArticle: anArticle.
	anArticle announcer
		when: LiRePropertyChanged
			do: [ :e | 
			e property = #bibtex
				ifTrue: [ self normalizeArticle: e instance ] ];
		when: LiReRequestLoadPdf do: [ :r | self schedule: [ actionLoadPdf executeIn: r article ] title: 'Load PDF' ];
		when: LiReRequestImportPdf do: [ :r | self schedule: [ actionImportPdf executeIn: r article ] title: 'Import PDF' ];
		when: LiReRequestLinkPdf do: [ :r | self schedule: [ actionLinkPdf executeIn: r article ] title: 'Link PDF' ];
		when: LiReRequestOpenPdf do: [ :r | self schedule: [ actionOpenPdf executeIn: r article ] title: 'Open PDF' ];
		when: LiReRequestLinkOpenPdf do: [ :r | self schedule: [ actionLinkOpenPdf executeIn: r article ] title: 'Link & open PDF' ];
		when: LiReRequestLoadImportLinkOpenPdf
			do: [ :r | self schedule: [ actionLoadImportLinkOpenPdf executeIn: r article ] title: 'Load, import, link & open PDF' ];
		when: LiReRequestOpenWithAllOtherThingsNecessaryDoneBeforePdf
			do: [ :r | 
			self
				schedule: [ actionOpenWithAllOtherThingsNecessaryDoneBeforePdf executeIn: r article ]
				title: 'Open PDF with all the other things necessary done before' ]