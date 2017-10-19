converting
asDetailsWidget
	| superModel model |
	superModel := super asDetailsWidget.
	model := DynamicComposableModel new.
	model
		instantiateModels: #(superModel DynamicComposableModel nameLabel LabelModel name_ TextInputFieldModel countryLabel LabelModel country TextInputFieldModel).
	model nameLabel label: 'Name'.
	model countryLabel label: 'Country'.
	model
		layout:
			(SpecLayout composed
				newColumn: [ :column | 
					column
						newRow: [ :row | row add: #superModel ];
						newRow: [ :row | 
							row
								add: #nameLabel;
								add: #name_ ];
						newRow: [ :row | 
							row
								add: #countryLabel;
								add: #country ] ];
				yourself).
	model name_ text: name.
	model country text: country.
	model name_ acceptBlock: [ :s | self name: s ].
	model country acceptBlock: [ :s | self country: s ].
	model assign: superModel to: #superModel.
	^ model