converting
asDetailsWidget
	| superModel model |
	superModel := super asDetailsWidget.
	model := DynamicComposableModel new.
	model instantiateModels: #(superModel DynamicComposableModel nameLabel LabelModel name_ TextInputFieldModel).
	model nameLabel label: 'Name'.
	model
		layout:
			(SpecLayout composed
				newColumn: [ :column | 
					column
						newRow: [ :row | row add: #superModel ];
						newRow: [ :row | 
							row
								add: #nameLabel;
								add: #name_ ] ];
				yourself).
	model assign: superModel to: #superModel.
	model name_ text: name.
	model name_ acceptBlock: [ :s | self name: s ].
	^ model