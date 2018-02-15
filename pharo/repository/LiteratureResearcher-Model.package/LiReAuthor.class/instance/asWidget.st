converting
asWidget
	| model |
	model := TextInputFieldModel new
		text: self name;
		acceptBlock: [ :s | self name: s ];
		yourself.
	self whenPropertyChangedDo: [ model text: self name ].
	^ model