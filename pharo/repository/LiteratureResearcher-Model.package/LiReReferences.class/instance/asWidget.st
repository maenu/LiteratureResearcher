converting
asWidget
	| superModel model |
	superModel := super asWidget.
	model := DynamicComposableModel new.
	model title: 'Details'.
	model instantiateModels: #(superModel DynamicComposableModel bibtexLabel LabelModel bibtex TextModel textLabel LabelModel text TextModel).
	model bibtexLabel label: 'Bibtex'.
	model textLabel label: 'Text'.
	model bibtex
		text:
			(bibtex
				ifNotNil: [ (LiReBibRenderer new
						render: bibtex;
						contents) trimmed ]);
		acceptBlock: [ :s | self bibtex: (LiReBibParser parse: s) entries first ].
	model text
		text: text;
		acceptBlock: [ :s | self text: s ].
	model assign: superModel to: #superModel.
	self
		whenPropertyChangedDo: [ model bibtex
				text:
					(LiReBibRenderer new
						render: bibtex;
						contents) trimmed.
			model text text: text ].
	model
		layout:
			(SpecLayout composed
				newColumn: [ :column | 
					column
						newRow: [ :row | row add: #superModel ];
						newRow: [ :row | 
							row
								add: #bibtexLabel;
								add: #bibtex ];
						newRow: [ :row | 
							row
								add: #textLabel;
								add: #text ] ];
				yourself).
	^ model