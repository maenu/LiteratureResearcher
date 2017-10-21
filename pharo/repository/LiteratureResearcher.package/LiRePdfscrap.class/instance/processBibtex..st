public
processBibtex: aBibtexEntry
	| directory result |
	directory := FileReference newTempFilePrefix: 'LiRePdfscrap' suffix: ''.
	directory ensureCreateDirectory.
	subprocess
		execute:
			{(LiReSubprocess
				escape:
					(LiReBibRenderer new
						render: aBibtexEntry;
						contents)).
			(LiReSubprocess escape: directory pathString)}
		wait: 30 seconds.
	result := directory / 'SUCCESS' / ('1_' , aBibtexEntry key , '.pdf').
	result exists
		ifFalse: [ LiRePdfscrapProcessError signal: 'Could not find "' , result pathString , '"' ].
	^ result