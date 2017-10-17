instance creation
newTabNode
	| model |
	model := DynamicComposableModel new.
	model instantiateModels: #(nameLabel LabelModel name TextInputFieldModel countryLabel LabelModel country TextInputFieldModel).
	model nameLabel label: 'Name'.
	model countryLabel label: 'Country'.
	model
		layout:
			(SpecLayout composed
				newRow: [ :row | 
					row
						newColumn: [ :column | 
							column
								add: #nameLabel;
								add: #name ] ];
				newRow: [ :row | 
					row
						newColumn: [ :column | 
							column
								add: #countryLabel;
								add: #country ] ];
				yourself).
	^ model