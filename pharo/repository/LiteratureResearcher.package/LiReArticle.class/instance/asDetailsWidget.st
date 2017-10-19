converting
asDetailsWidget
	| superModel model |
	superModel := super asDetailsWidget.
	model := DynamicComposableModel new.
	model instantiateModels: #(superModel DynamicComposableModel bibtex TextModel).
	model
		layout:
			(SpecLayout composed
				newColumn: [ :c | 
					c
						add: #superModel height: model class toolbarHeight;
						add: #bibtex ];
				yourself).
	model assign: superModel to: #superModel.
	model bibtex
		text:
			(LiReBibBibRenderer new
				render: bibtex;
				contents) trimmed.
	model bibtex acceptBlock: [ :s | self bibtex: (CZBibParser parse: s) entries first ].
	^ model