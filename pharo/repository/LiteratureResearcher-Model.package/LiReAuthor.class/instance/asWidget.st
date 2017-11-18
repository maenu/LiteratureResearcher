converting
asWidget
	| model |
	model := TextInputFieldModel new
		text: name;
		acceptBlock: [ :s | self name: s ];
		yourself.
	self whenPropertyChangedDo: [ model text: name ].
	^ model