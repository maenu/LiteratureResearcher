converting
asWidget
	| model |
	model := TextModel new
		text:
			(LiReBibRenderer new
				render: bibtex;
				contents) trimmed;
		acceptBlock: [ :s | self bibtex: (LiReBibParser parse: s) entries first ];
		yourself.
	self
		whenPropertyChangedDo: [ model
				text:
					(LiReBibRenderer new
						render: bibtex;
						contents) trimmed ].
	^ model