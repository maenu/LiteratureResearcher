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
			{bibtexEntry.
			subDirectory pathString}.
	^ self processResult: anId in: subDirectory