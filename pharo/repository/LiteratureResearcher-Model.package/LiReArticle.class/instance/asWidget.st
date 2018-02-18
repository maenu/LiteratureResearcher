converting
asWidget
	| superModel model |
	superModel := super asWidget.
	model := DynamicComposableModel new.
	model instantiateModels: #(superModel DynamicComposableModel bibtexLabel LabelModel bibtex TextModel).
	model bibtexLabel label: 'Bibtex'.
	model bibtex
		text:
			(self bibtex
				ifNotNil: [ (LiReBibRenderer new
						render: self bibtex;
						contents) trimmed ]);
		acceptBlock: [ :s | self bibtex: (LiReBibParser parse: s) entries first ].
	model assign: superModel to: #superModel.
	self
		whenPropertyChangedDo: [ model bibtex
				text:
					(LiReBibRenderer new
						render: self bibtex;
						contents) trimmed ].
	model
		layout:
			(SpecLayout composed
				newColumn: [ :column | 
					column
						newRow: [ :row | row add: #superModel ] height: DynamicComposableModel toolbarHeight;
						newRow: [ :row | 
							row
								add: #bibtexLabel;
								add: #bibtex ] ];
				yourself).
	^ model