converting
asDetailsWidget
	| superModel model |
	superModel := super asDetailsWidget.
	model := DynamicComposableModel new.
	model instantiateModels: #(superModel DynamicComposableModel nameLabel LabelModel name_ TextInputFieldModel emailLabel LabelModel email TextInputFieldModel).
	model nameLabel label: 'Name'.
	model emailLabel label: 'Email'.
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
								add: #emailLabel;
								add: #email ] ];
				yourself).
	model assign: superModel to: #superModel.
	model name_ text: name.
	model email text: email.
	model name_ acceptBlock: [ :s | name := s ].
	model email acceptBlock: [ :s | email := s ].
	^ model