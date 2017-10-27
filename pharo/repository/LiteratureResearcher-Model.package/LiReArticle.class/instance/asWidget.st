converting
asWidget
	| superModel model |
	superModel := super asWidget.
	model := DynamicComposableModel new.
	model title: 'Details'.
	model instantiateModels: #(superModel DynamicComposableModel bibtex TextModel).
	model assign: superModel to: #superModel.
	model bibtex
		text:
			(LiReBibRenderer new
				render: bibtex;
				contents) trimmed;
		acceptBlock: [ :s | self bibtex: (LiReBibParser parse: s) entries first ].
	self
		whenPropertyChangedDo: [ model bibtex
				text:
					(LiReBibRenderer new
						render: bibtex;
						contents) trimmed ].
	model
		layout:
			(SpecLayout composed
				newColumn: [ :c | 
					c
						add: #superModel height: model class toolbarHeight;
						add: #bibtex ];
				yourself).
	^ model