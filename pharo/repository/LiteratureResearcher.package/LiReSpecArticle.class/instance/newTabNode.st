instance creation
newTabNode
	| model |
	model := DynamicComposableModel new.
	model instantiateModels: #(bibtex TextModel).
	model
		layout:
			(SpecLayout composed
				newColumn: [ :column | column add: #bibtex ];
				yourself).
	^ model