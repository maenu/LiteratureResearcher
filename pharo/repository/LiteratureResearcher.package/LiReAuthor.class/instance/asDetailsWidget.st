converting
asDetailsWidget
	| superModel model |
	superModel := super asDetailsWidget.
	model := DynamicComposableModel new.
	model instantiateModels: #(superModel DynamicComposableModel nameLabel LabelModel name_ TextInputFieldModel).
	model assign: superModel to: #superModel.
	model nameLabel label: 'Name'.
	model name_
		text: name;
		acceptBlock: [ :s | self name: s ].
	self whenPropertyChangedDo: [ model name_ text: name ].
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
	^ model