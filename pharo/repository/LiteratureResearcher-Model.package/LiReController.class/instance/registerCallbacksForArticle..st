accessing
registerCallbacksForArticle: anArticle
	^ anArticle announcer
		when: LiReRequestImportPdf do: [ :r | self schedule: [ actionImportPdf executeIn: r article ] title: 'Import PDF' ];
		when: LiReRequestLinkPdf do: [ :r | self schedule: [ actionLinkPdf executeIn: r article ] title: 'Link PDF' ];
		when: LiReRequestLoadPdf do: [ :r | self schedule: [ actionLoadPdf executeIn: r article ] title: 'Load PDF' ];
		when: LiReRequestOpenPdf do: [ :r | self schedule: [ actionOpenPdf executeIn: r article ] title: 'Open PDF' ];
		when: LiReRequestLoadReferencedByFromCsv
			do: [ :r | self schedule: [ actionLoadReferencedByFromCsv executeIn: r csv with: anArticle ] title: 'Load referenced by from CSV' ]