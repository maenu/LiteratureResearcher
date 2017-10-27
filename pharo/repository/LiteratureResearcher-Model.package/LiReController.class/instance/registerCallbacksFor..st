accessing
registerCallbacksFor: node
	^ node announcer
		when: LiReRequestImportPdf do: [ :r | self schedule: [ actionImportPdf executeIn: r article ] title: 'Import PDF' ];
		when: LiReRequestLinkPdf do: [ :r | self schedule: [ actionLinkPdf executeIn: r article ] title: 'Link PDF' ];
		when: LiReRequestLoadPdf do: [ :r | self schedule: [ actionLoadPdf executeIn: r article ] title: 'Load PDF' ];
		when: LiReRequestOpenPdf do: [ :r | self schedule: [ actionOpenPdf executeIn: r article ] title: 'Open PDF' ];
		when: LiReRequestScholarPy do: [ :r | self schedule: [ r block cull: scholarPy ] title: 'Searching on Scholar' ]