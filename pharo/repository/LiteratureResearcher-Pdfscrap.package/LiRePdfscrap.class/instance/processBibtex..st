public
processBibtex: aBibtexEntry
	| directory result pdf |
	directory := FileReference newTempFilePrefix: 'LiRePdfscrap' suffix: ''.
	directory ensureCreateDirectory.
	result := subprocess
		execute:
			{(LiReSubprocess
				escape:
					(LiReBibRenderer new
						render: aBibtexEntry;
						contents)).
			(LiReSubprocess escape: directory pathString)}
		wait: 30 seconds.
	pdf := directory / 'SUCCESS' / ('1_' , aBibtexEntry key , '.pdf').
	pdf exists
		ifFalse: [ LiRePdfscrapProcessError
				signal: 'Could not find "' , pdf pathString , '"' , String lf , 'stdout: ' , result out , String lf , 'stderr: ' , result err ].
	^ pdf