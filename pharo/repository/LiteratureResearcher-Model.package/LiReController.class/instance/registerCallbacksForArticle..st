accessing
registerCallbacksForArticle: anArticle
	^ anArticle announcer
		when: LiReRequestLoadPdf do: [ :r | self schedule: [ actionLoadPdf executeIn: r article ] title: 'Load PDF' ];
		when: LiReRequestImportPdf do: [ :r | self schedule: [ actionImportPdf executeIn: r article ] title: 'Import PDF' ];
		when: LiReRequestLinkPdf do: [ :r | self schedule: [ actionLinkPdf executeIn: r article ] title: 'Link PDF' ];
		when: LiReRequestOpenPdf do: [ :r | self schedule: [ actionOpenPdf executeIn: r article ] title: 'Open PDF' ];
		when: LiReRequestLoadImportLinkOpenPdf
			do: [ :r | self schedule: [ actionLoadImportLinkOpenPdf executeIn: r article ] title: 'Load, import, link & open PDF' ];
		when: LiReRequestLoadReferencedByFromCsv
			do: [ :r | self schedule: [ actionLoadReferencedByFromCsv executeIn: r csv with: anArticle ] title: 'Load referenced by from CSV' ]