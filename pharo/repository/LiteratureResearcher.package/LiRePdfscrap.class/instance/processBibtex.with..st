public
processBibtex: anId with: aBibtexEntry
	| bibtexEntry subDirectory out |
	bibtexEntry := self prepareBibtex: anId with: aBibtexEntry.
	subDirectory := workingDirectory directory / anId.
	subDirectory exists
		ifTrue: [ ^ self processResult: anId in: subDirectory ].
	subDirectory := workingDirectory ensureSubDirectoryNamed: anId.
	out := subprocess
		execute:
			{(LiReSubprocess
				escape:
					(LiReBibBibRenderer new
						render: bibtexEntry;
						contents)).
			(LiReSubprocess escape: subDirectory pathString)}
		wait: 30 seconds.
	^ self processResult: anId in: subDirectory