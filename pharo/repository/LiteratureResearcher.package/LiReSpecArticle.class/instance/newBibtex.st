instance creation
newBibtex
	| text |
	text := self newText.
	text acceptBlock: [ :s | article bibtex: (CZBibParser parse: s) ].
	^ text