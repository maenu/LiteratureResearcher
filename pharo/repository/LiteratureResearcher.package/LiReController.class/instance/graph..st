accessing
graph: anObject
	graph := anObject.
	view := graph asRoassalView.
	graph announcer
		when: LiReNodeAdded
		do: [ :e | 
			(e node isKindOf: LiReArticle)
				ifTrue: [ e node announcer
						when: LiReRequestImportPdf do: [ :r | actionImportPdf executeIn: r article ];
						when: LiReRequestLinkPdf do: [ :r | actionLinkPdf executeIn: r article ];
						when: LiReRequestLoadPdf do: [ :r | actionLoadPdf executeIn: r article ];
						when: LiReRequestOpenPdf do: [ :r | actionOpenPdf executeIn: r article ] ] ]