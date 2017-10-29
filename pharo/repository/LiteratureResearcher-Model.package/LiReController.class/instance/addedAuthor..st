accessing
addedAuthor: anAuthor
	^ anAuthor announcer
		when: LiReRequestLoadWrittenByFromCsv
			do: [ :r | self schedule: [ actionLoadWrittenByFromCsv executeIn: r csv with: r node ] title: 'Load referenced by from CSV' ]