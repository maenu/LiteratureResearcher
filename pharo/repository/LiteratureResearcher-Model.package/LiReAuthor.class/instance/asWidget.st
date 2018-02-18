converting
asWidget
	| superModel model |
	superModel := super asWidget.
	model := DynamicComposableModel new.
	model instantiateModels: #(superModel DynamicComposableModel nameLabel LabelModel nameText TextInputFieldModel).
	model nameLabel label: 'Name'.
	model nameText
		text: self name;
		acceptBlock: [ :s | self name: s ].
	model assign: superModel to: #superModel.
	self whenPropertyChangedDo: [ model nameText text: self name ].
	model
		layout:
			(SpecLayout composed
				newColumn: [ :column | 
					column
						newRow: [ :row | row add: #superModel ] height: DynamicComposableModel toolbarHeight;
						newRow: [ :row | 
							row
								add: #nameLabel;
								add: #nameText ] ];
				yourself).
	^ model