instance creation
newTabNode
	| model |
	model := DynamicComposableModel new.
	model instantiateModels: #(nameLabel LabelModel name TextInputFieldModel emailLabel LabelModel email TextInputFieldModel).
	model nameLabel label: 'Name'.
	model emailLabel label: 'Email'.
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
								add: #emailLabel;
								add: #email ] ];
				yourself).
	^ model