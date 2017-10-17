converting
asDetailsWidget
	| model |
	model := DynamicComposableModel new.
	model instantiateModels: #(bibtex TextModel).
	model
		layout:
			(SpecLayout composed
				newColumn: [ :column | column add: #bibtex ];
				yourself).
	model bibtex
		text:
			(LiReBibBibRenderer new
				render: bibtex;
				contents).
	model bibtex acceptBlock: [ :s | bibtex := CZBibParser parse: s ].
	^ model