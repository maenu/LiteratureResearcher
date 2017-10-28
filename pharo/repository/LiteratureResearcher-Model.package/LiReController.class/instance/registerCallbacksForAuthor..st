accessing
registerCallbacksForAuthor: anAuthor
	^ anAuthor announcer
		when: LiReRequestLoadWrittenByFromCsv
			do: [ :r | self schedule: [ actionLoadWrittenByFromCsv executeIn: r csv with: anAuthor ] title: 'Load referenced by from CSV' ]