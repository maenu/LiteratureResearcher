execution
processBibtex: aBibtexEntry
	| directory result pdf |
	directory := FileReference newTempFilePrefix: 'LiRePdfdbscrap' suffix: ''.
	directory ensureCreateDirectory.
	Halt now.
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
		ifFalse: [ LiRePdfdbscrapProcessError
				signal: 'Could not find "' , pdf pathString , '"' , String lf , 'stdout: ' , result out , String lf , 'stderr: ' , result err ].
	^ pdf