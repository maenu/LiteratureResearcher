converting
asDetailsWidget
	| superModel model |
	superModel := super asDetailsWidget.
	model := DynamicComposableModel new.
	model
		instantiateModels: #(superModel DynamicComposableModel nameLabel LabelModel name TextInputFieldModel countryLabel LabelModel country TextInputFieldModel).
	model nameLabel label: 'Name'.
	model countryLabel label: 'Country'.
	model
		layout:
			(SpecLayout composed
				newRow: [ :row | row add: #superModel ];
				newRow: [ :row | 
					row
						add: #nameLabel;
						add: #name ];
				newRow: [ :row | 
					row
						add: #countryLabel;
						add: #country ];
				yourself).
	model name text: name.
	model country text: country.
	model name acceptBlock: [ :s | name := s ].
	model country acceptBlock: [ :s | country := s ].
	model assign: superModel to: #superModel.
	^ model